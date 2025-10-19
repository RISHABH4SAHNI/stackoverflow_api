class QuestionsController < ApplicationController
  # GET /questions
  def index
    questions = Question.all.order(created_at: :desc)
    render json: QuestionSerializer.new(questions).serializable_hash, status: :ok
  end

  # POST /questions
  def create
    question = Question.new(question_params)
    question.upvotes = 0
    if question.save
      render json: QuestionSerializer.new(question).serializable_hash, status: :created
    else
      render json: { errors: question.errors.full_messages.map { |msg| { title: msg } } }, status: :unprocessable_entity
    end
  end

  # POST /questions/:id/upvote
  def upvote
    question = Question.find_by(id: params[:id])
    if question
      question.increment!(:upvotes)
      render json: QuestionSerializer.new(question).serializable_hash.merge({ meta: { message: "Question upvoted!" } }), status: :ok
    else
      render json: { errors: [{ title: "Question not found" }] }, status: :not_found
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
