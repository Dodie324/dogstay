class Sitter < ActiveRecord::Base
  has_many :dogs
  has_many :reviews
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[a-z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+\z/ }
  validates :encrypted_password, presence: true, length: { minimum: 8 }
  validates :phone_number, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :headline, presence: true, length: { minimum: 20 }
  validates :description, presence: true, length: { minimum: 50 }
  validates :have_dogs, presence: true
  validates :have_children, presence: true
  validates :property_type, presence: true
  validates :yard_type, presence: true
  validates :price, presence: true
  validates :availability, presence: true
  validates_presence_of :user
end
