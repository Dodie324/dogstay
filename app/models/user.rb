class User < ActiveRecord::Base
  has_many :reviews_received,
    class_name: "Review", foreign_key: :sitter_id
  has_many :reviews_written,
    class_name: "Review", foreign_key: :user_id
  mount_uploader :image, AvatarUploader

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

  AVAILABILITY = [
    "",
    "Weekends",
    "Weekdays",
    "Any day of the week"
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

  validates :availability,
    inclusion: {
      in: AVAILABILITY
    }
end
