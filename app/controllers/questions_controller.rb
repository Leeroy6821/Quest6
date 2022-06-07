class QuestionsController < ApplicationController
  def show
    @question = Question.find_by id: params[:id]
  end
  def destroy
    @question = Question.find_by id: params[:id]
    @question.destroy
    redirect_to questions_path
  end

  def edit                                                 # Метод відображає форму
    @question = Question.find_by id: params[:id]
  end

  def update                                               # Метод обробляє форму
    @question = Question.find_by id: params[:id]
    if @question.update question_params
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
      redirect_to questions_path
    else
      render :new
  end
end

private

  def question_params
      params.require(:question).permit(:title, :body)
  end
end