class AnswersController < ApplicationController
  # GET /questions/:question_id/answers
  def index
    question = Question.find_by(id: params[:question_id])
    if question
      answers = question.answers.order(created_at: :desc)
      render json: AnswerSerializer.new(answers).serializable_hash, status: :ok
    else
      render json: { errors: [{ title: "Question not found" }] }, status: :not_found
    end
  end

  # POST /questions/:question_id/answers
  def create
    question = Question.find_by(id: params[:question_id])
    if question
      answer = question.answers.new(answer_params)
      answer.upvotes = 0
      if answer.save
        render json: AnswerSerializer.new(answer).serializable_hash, status: :created
      else
        render json: { errors: answer.errors.full_messages.map { |msg| { title: msg } } }, status: :unprocessable_entity
      end
    else
      render json: { errors: [{ title: "Question not found" }] }, status: :not_found
    end
  end

  # POST /answers/:id/upvote
  def upvote
    answer = Answer.find_by(id: params[:id])
    if answer
      answer.increment!(:upvotes)
      render json: AnswerSerializer.new(answer).serializable_hash.merge({ meta: { message: "Answer upvoted!" } }), status: :ok
    else
      render json: { errors: [{ title: "Answer not found" }] }, status: :not_found
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
