class User < ApplicationRecord
  has_secure_password
  has_many :questions

  accepts_nested_attributes_for :questions
end
