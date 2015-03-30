class User < ActiveRecord::Base
  has_many :owners
  has_many :sitters

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
end
