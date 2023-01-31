class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy edit update]

  def show
    @answer = @question.answers.build
  end
  
  def destroy
    @question.destroy
    flash[:info] = "Question deleted"
    redirect_to questions_path
  end

  def edit                                                 # Метод відображає форму
  end

  def update                                               # Метод обробляє форму
    if @question.update question_params
      flash[:success] = "Question updated"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def index
    @question = Question.all
  end

  def new                                                  # Метод відображає форму
    @question = Question.new
  end

  def create                                               # Метод обробляє форму
    @question = Question.new question_params               # Створити питання з переданими параметрами
    if @question.save
      flash[:success] = "Question created!"
      redirect_to questions_path
    else
      render :new
  end
end

private

  def question_params
      params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find  params[:id]
  end
end