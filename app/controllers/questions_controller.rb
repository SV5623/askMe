class QuestionsController < ApplicationController
  before_action :set_question , only: %i[update show destroy edit]

  def create
    #question_params = params.require(:question).permit(:body , :user_id)
    question = Question.create(question_params)
    redirect_to question_path(question), notice: "New question was created!"
  end

  def update
    # set_question >> Є функція before_action
    @question.update(question_params)
    
    redirect_to question_path(@question), notice: "The question was updated!"
  end

  def destroy
   # set_question >> Є функція before_action
    @question.destroy
    redirect_to questions_path, notice: "The question was deleted!"
  end

  def show
    # set_question >> Є функція before_action
  end

  def index
    @question = Question.new
    @questions = Question.all

  end

  def new
    @question = Question.new
  end

  def edit
    # set_question >> Є функція before_action
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end
  def set_question
    @question = Question.find(params[:id])
  end
end 