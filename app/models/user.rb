class User < ApplicationRecord
  has_secure_password
  has_many :questions
  has_many :matches
  has_many :matched_with_users, class_name: "Match", foreign_key: :matched_with_user_id

  accepts_nested_attributes_for :questions
end
