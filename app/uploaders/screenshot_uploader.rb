class ScreenshotUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
