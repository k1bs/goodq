# questions controller
class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments
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

  private

  def question_params
    params.require(:question).permit(:question)
  end
end
