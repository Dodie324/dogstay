class Message < ActiveRecord::Base
  belongs_to :sitter, class_name: "User"
  belongs_to :user

  validates :subject, presence: true
  validates :message, presence: true
end
