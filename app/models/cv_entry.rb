class CvEntry < ApplicationRecord
  validates :time, presence: true
  validates :title,
    presence: true,
    uniqueness: true
  validates :order, presence: true
end
