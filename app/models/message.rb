class Message < ActiveRecord::Base
  belongs_to :sitter, class_name: "User"
  belongs_to :user
end
