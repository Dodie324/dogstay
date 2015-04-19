class User < ActiveRecord::Base
  has_many :reviews_received,
    class_name: "Review", foreign_key: :sitter_id
  has_many :reviews_written,
    class_name: "Review", foreign_key: :user_id
  belongs_to :location
  mount_uploader :image, AvatarUploader

  geocoded_by :address
  after_validation :geocode

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

  STATE = [
    "",
    "AK",
    "AL",
    "AR",
    "AS",
    "AZ",
    "CA",
    "CO",
    "CT",
    "DC",
    "DE",
    "FL",
    "GA",
    "GU",
    "HI",
    "IA",
    "ID",
    "IL",
    "IN",
    "KS",
    "KY",
    "LA",
    "MA",
    "MD",
    "ME",
    "MI",
    "MN",
    "MO",
    "MS",
    "MT",
    "NC",
    "ND",
    "NE",
    "NH",
    "NJ",
    "NM",
    "NV",
    "NY",
    "OH",
    "OK",
    "OR",
    "PA",
    "PR",
    "RI",
    "SC",
    "SD",
    "TN",
    "TX",
    "UT",
    "VA",
    "VI",
    "VT",
    "WA",
    "WI",
    "WV",
    "WY"
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

  validates :state,
    inclusion: {
      in: STATE
    }

  def address
    [address1, address2, city, state].compact.join(', ')
  end
end
