class WomensInventory < ActiveRecord::Base
  mount_uploader :image, PictureUploader
  validate :image_size

  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "should be less than 5MB")
    end
  end
end
