# frozen_string_literal: true

class QuestionSerializer
  include JSONAPI::Serializer
  attributes :title, :body, :upvotes
  has_many :answers
end
