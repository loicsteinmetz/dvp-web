class AddColumnToCvEntry < ActiveRecord::Migration[5.2]
  def change
    change_table :cv_entries do |t|
      t.integer :order
    end
  end
end
