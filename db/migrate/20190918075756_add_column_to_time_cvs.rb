class AddColumnToTimeCvs < ActiveRecord::Migration[5.2]
  def change
    change_table :time_cvs do |t|
      t.integer :order
    end
  end
end
