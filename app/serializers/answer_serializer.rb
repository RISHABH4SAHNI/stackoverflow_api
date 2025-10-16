# frozen_string_literal: true

class AnswerSerializer
  include JSONAPI::Serializer
  attributes :body, :upvotes
  belongs_to :question
end
