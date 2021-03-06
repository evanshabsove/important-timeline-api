class MatchSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :user
  belongs_to :matched_with_user, :foreign_key => :matched_with_user_id, class_name: "User"
  attributes :matched_with_user_id, :user_id
end
