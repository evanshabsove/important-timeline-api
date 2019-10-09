class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :given_name, :family_name, :date
  has_many :questions
end
