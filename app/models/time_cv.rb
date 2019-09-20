class TimeCv < ApplicationRecord
  validates :date,
    presence: true,
    uniqueness: true
  validates :order,
    presence: true,
    uniqueness: true
  has_many :entries, foreign_key: 'date', class_name: 'CvEntry', dependent: :destroy

  def self.set_new_order
    return TimeCv.all.size
  end

  def first_place?
    self.order == 0
  end

  def last_place?
    self.order == TimeCv.all.size - 1
  end

  def self.reorder_down(ref)
    TimeCv.where(order: ref - 1).update(order: ref)
  end

  def self.reorder_up(ref)
    TimeCv.where(order: ref + 1).update(order: ref)
  end
end
