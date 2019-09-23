class TimeCv < ApplicationRecord
  validates :date,
    presence: true,
    uniqueness: true
  validates :order,
    presence: true
  has_many :entries, foreign_key: 'date', class_name: 'CvEntry', dependent: :destroy

  before_validation :set_new_order, on: :create
  after_destroy :reorder_after_destroy

  def set_new_order
    self.order ||= TimeCv.count
  end

  def first_place?
    self.order == 0
  end

  def last_place?
    self.order == TimeCv.all.size - 1
  end

  def reorder_after_destroy
    TimeCv.all.each do |time|
      new_order = time.order - 1
      if time.order > self.order
        time.update(order: new_order)
      end
    end
  end
end
