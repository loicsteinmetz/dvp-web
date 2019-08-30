class Folio < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true
  validates :website,
    presence: true,
    format: { with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/ }
  validates :type, presence: true
  validates :description, presence: true
  validates :techs, presence: true
  validates :description_mini, presence: true
  has_one_attached :capture
  validate :capture?
  validate :img_validation

  private

  def capture?
    errors.add(:base, "Image must be attached to the event") unless self.capture.attached?
  end

  def img_validation
    if self.capture.attached?
      if !self.capture.blob.content_type.starts_with?('image/')
        self.capture.purge
        errors[:base] << 'Wrong format for your image'
      end
    end
  end
end
