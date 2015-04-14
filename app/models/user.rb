class User < ActiveRecord::Base
  has_many :user_reviews
  has_many :reviews, through: :user_reviews

  PROPERTY = [
    "",
    "Apartment",
    "Condo",
    "Townhouse",
    "House"
  ]

  YARD = [
    "",
    "None",
    "Fenced",
    "Open"
  ]

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :sitter,
    inclusion: {
      in: [true, false]
    }

  validates :have_dogs,
    inclusion: {
      in: [true, false]
    }

  validates :have_children,
    inclusion: {
      in: [true, false]
    }

  validates :property_type,
    inclusion: {
      in: PROPERTY
    }

  validates :yard_type,
    inclusion: {
      in: YARD
    }

    def first_initial
      sitter.last_name
    end
end
