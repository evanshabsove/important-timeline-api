class MatchedWithUserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :given_name, :family_name, :email
  has_many :questions
end
