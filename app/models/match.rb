class Match < ApplicationRecord
  belongs_to :user
  belongs_to :matched_with_user, :foreign_key => :matched_with_user_id, class_name: "User"
end
