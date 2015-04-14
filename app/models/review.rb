class Review < ActiveRecord::Base
  RATING = [1, 2, 3, 4, 5]

  has_many :user_reviews
  has_many :users, through: :user_reviews

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :body, presence: true, length: { minimum: 20 }

  def editable_by?(user)
    users.where(sitter: false).first == user
  end

  def name
    "#{first_name} #{last_name}"
  end

  def first_name
    users.where(sitter: false).first.first_name
  end

  def last_name
    users.where(sitter: false).first.last_name[0] + "."
  end
end
