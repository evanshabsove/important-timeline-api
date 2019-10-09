class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :question, :answer, :date
  belongs_to :user
end
