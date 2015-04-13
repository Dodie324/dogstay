class Review < ActiveRecord::Base
  RATING = [1, 2, 3, 4, 5]

  has_many :user_reviews
  has_many :users, through: :user_reviews

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :body, presence: true, length: { minimum: 20 }

  # def editable_by?(user)
  #   user == self.user
  # end
end
