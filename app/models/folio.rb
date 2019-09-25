class Folio < ApplicationRecord
  validates :title, presence: true
  validates :website,
    presence: true,
    format: { with: /\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/i }
  validates :work, presence: true
  validates :description, presence: true
  validates :techs, presence: true
  validates :description_mini, presence: true
  validates :order, presence: true
  has_one_attached :capture
  validate :capture?
  validate :img_validation
  before_validation :set_new_order, on: :create
  after_destroy :reorder_after_destroy

  def first_place?
    self.order == 0
  end

  def last_place?
    self.order == Folio.count - 1
  end

  private

  def capture?
    errors[:capture] << "Image must be attached to the event" unless self.capture.attached?
  end

  def img_validation
    if self.capture.attached?
      if !self.capture.blob.content_type.starts_with?('image/')
        self.capture.purge
        errors[:capture] << 'Wrong format for your image'
      end
    end
  end

  def set_new_order
    self.order ||= Folio.count
  end

  def reorder_after_destroy
    Folio.all.each do |folio|
      new_order = folio.order - 1
      if folio.order > self.order
        folio.update(order: new_order)
      end
    end
  end
end
