class User < ActiveRecord::Base
  has_many :reviews_received,
    class_name: "Review", foreign_key: :sitter_id
  has_many :reviews_written,
    class_name: "Review", foreign_key: :user_id
  belongs_to :location
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

  validates :email,
    presence: true,
    uniqueness: true,
    format: {
      with: /\A[a-z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+\z/
    }

  validates :phone_number,
    presence: true,
    format: {
      with: /\d[0-9]\)*\z/,
      message: "bad format"
    }

  validates :zipcode,
    presence: true,
    format: {
      with: /\A\d{5}-\d{4}|\A\d{5}\z/,
      message: "should be in the form 12345 or 12345-1234"
    }

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

  def self.search(search)
    if search
      where(["name ILIKE ?", "%#{location}%"])
    else
      all
    end
  end
end
