class Review < ActiveRecord::Base
  RATING = [1, 2, 3, 4, 5]

  belongs_to :user
  belongs_to :sitter

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :body, presence: true
end
