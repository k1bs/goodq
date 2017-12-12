# comment controller
class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    @comment.score = 1
    if @comment.save!
      redirect_to question_comment_path(@question, @comment)
    else
      render :new
    end
  end

  def upvote
    Comment.find(params[:id]).increment!
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
