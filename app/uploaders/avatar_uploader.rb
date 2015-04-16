class AvatarUploader < CarrierWave::Uploader::Base
  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
