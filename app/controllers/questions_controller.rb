# questions controller
class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(id: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments.order(score: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.score = 1
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def upvote
    @question = Question.find(params[:question_id])
    @question.increment!(:score)
    redirect_to questions_path
  end

  def downvote
    @question = Question.find(params[:question_id])
    @question.decrement!(:score)
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:question)
  end
end
