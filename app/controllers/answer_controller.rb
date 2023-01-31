class AnswersController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]

  def create
    @answer = @question.answers.build answer_params
  end

  private

  def question_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @question = Question.find params[:question_id]
  end
end