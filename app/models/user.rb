class User < ApplicationRecord
  has_many :articles
  validates :username, presence: true, length: { in: 3..25 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, 
    format: { with: VALID_EMAIL_REGEX, message: "not a valid email address" }
end
