class TimeCv < ApplicationRecord
  validates :date,
    presence: true,
    uniqueness: true
  validate :order,
    presence: true,
    uniqueness: true
  has_many :entries, foreign_key: 'date', class_name: 'CvEntry'
end
