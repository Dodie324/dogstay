class Image < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image_upload, AvatarUploader

  validates :image_upload,
    presence: true
end

