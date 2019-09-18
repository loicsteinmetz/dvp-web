class TimeCv < ApplicationRecord
  validates :date,
    presence: true,
    uniqueness: true
  has_many :cv_entries
end
