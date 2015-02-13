class CommentsController < ApplicationController
  before_action :set_comment, except: [:new, :create]
  before_action :set_booking
  authorize_resource :only => [:new, :create, :edit,:update,:destroy]

  def new
    @comment = @booking.comments.new
  end

  def create
    @comment = Comment.build_from(@booking, current_user.id, params[:comment][:body])

    # @comment.title = params[:comment][:title] 

    if @comment.save
      redirect_to @booking
    else
      render :js => "alert('error saving comment');"
    end
  end

  def destroy
    if @comment.destroy
      render :json => @comment, :status => :ok
    else
      render :js => "alert('error deleting comment');"
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def prepare_new_comment
    @comment = Comment.new(commentable_id: @booking.id, commentable_type: @booking.constantize)
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :commentable_id, :commentable_type)
  end
  
end