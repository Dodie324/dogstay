class UserReview < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates_presence_of :review, presence: true
  validates_presence_of :user, presence: true
end
