class AnswersController < ApplicationController
  # GET /questions/:question_id/answers
  def index
    question = Question.find_by(id: params[:question_id])
    if question
      answers = question.answers.order(created_at: :desc)
      render json: answers.as_json(only: [:id, :body, :upvotes])
    else
      render json: { error: "Question not found" }, status: :not_found
    end
  end

  # POST /questions/:question_id/answers
  def create
    question = Question.find_by(id: params[:question_id])
    if question
      answer = question.answers.new(answer_params)
      answer.upvotes = 0
      if answer.save
        render json: answer, status: :created
      else
        render json: { error: answer.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Question not found" }, status: :not_found
    end
  end

  # POST /answers/:id/upvote
  def upvote
    answer = Answer.find_by(id: params[:id])
    if answer
      answer.increment!(:upvotes)
      render json: { message: "Answer upvoted!", upvotes: answer.upvotes }
    else
      render json: { error: "Answer not found" }, status: :not_found
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
