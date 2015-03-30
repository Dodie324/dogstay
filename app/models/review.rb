class Review < ActiveRecord::Base
  belongs_to :sitter
  belongs_to :dog

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :body, presence: true
end
