class TimeCv < ApplicationRecord
  validates :date,
    presence: true,
    uniqueness: true
  validates :order,
    presence: true,
    uniqueness: true
  has_many :entries, foreign_key: 'date', class_name: 'CvEntry'
end