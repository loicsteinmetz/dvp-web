class CvEntry < ApplicationRecord
  validates :title,
    presence: true,
    uniqueness: true
  belongs_to :date, class_name: 'TimeCv'
end
