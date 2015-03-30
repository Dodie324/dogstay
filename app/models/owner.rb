class Owner < ActiveRecord::Base
  belongs_to :user
  has_many   :dogs

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[a-z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+\z/ }
  validates :encrypted_password, presence: true, length: { minimum: 8 }
  validates_presence_of :user
end
