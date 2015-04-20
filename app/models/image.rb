class Image < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  mount_uploader :image, AvatarUploader

  validates :image,
    presence: true,
    format: {
      with: %r{\.(jpg|jpeg|gif|png)z}i,
      message: "was not uploaded correctly"
    }
end

