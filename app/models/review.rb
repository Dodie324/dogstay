class Review < ActiveRecord::Base
  RATING = [1, 2, 3, 4, 5]

  belongs_to :sitter, class_name: "User"
  belongs_to :user

  validates :rating, presence: true, inclusion: { in: RATING }
  validates :body, presence: true, length: { minimum: 40 }
  validates :user, presence: true

  def sitter?
    user.find_by(sitter: true)
  end
end
