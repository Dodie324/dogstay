class Dog < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :age, presences: true
  validates :breed, presence: true
  validates :size, presence: true, inclusion: { in: %w(small medium large giant) }
  validates :fixed, presence: true
  validates :health_condition, presence: true
  validates_presence_of :user
end
