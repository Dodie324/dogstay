class User < ActiveRecord::Base
  PROPERTY = %w(Apartment Condo Townhouse House)
  YARD = %w(None Fenced Open)

  has_many :owners
  has_many :sitters

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
    presence: true,
    inclusion: {
      in: PROPERTY
    }

  validates :yard_type,
    presence: true,
    inclusion: {
      in: YARD
    }

end
