class QuestionsController < ApplicationController
  # GET /questions
  def index
    questions = Question.all.order(created_at: :desc)
    render json: questions.as_json(only: [:id, :title, :body, :upvotes])
  end

  # POST /questions
  def create
    question = Question.new(question_params)
    question.upvotes = 0
    if question.save
      render json: question, status: :created
    else
      render json: { error: question.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /questions/:id/upvote
  def upvote
    question = Question.find_by(id: params[:id])
    if question
      question.increment!(:upvotes)
      render json: { message: "Question upvoted!", upvotes: question.upvotes }
    else
      render json: { error: "Question not found" }, status: :not_found
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
