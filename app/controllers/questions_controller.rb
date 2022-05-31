class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    render plain: params
  end
end
