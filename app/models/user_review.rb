class UserReview < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :review, presence: true
  validates :user, presence: true
end
