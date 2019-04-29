class Note < ApplicationRecord
  belongs_to :card

  mount_uploader :screenshot, ScreenshotUploader
end
