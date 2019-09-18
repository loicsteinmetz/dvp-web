class CvEntry < ApplicationRecord
  validates :title,
    presence: true,
    uniqueness: true
  validates :order, presence: true
  belongs_to :date, class_name: 'TimeCv'
end
