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
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def upvote
    @comment = Comment.find(params[:comment_id])
    @question = @comment.question
    @comment.increment!(:score)
    redirect_to question_path(@question)
  end

  def downvote
    @comment = Comment.find(params[:comment_id])
    @question = @comment.question
    @comment.decrement!(:score)
    redirect_to question_path(@question)
  end

  def destroy
    question = Comment.find(params[:id]).question
    Comment.delete(params[:id])
    redirect_to question_path(question)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
