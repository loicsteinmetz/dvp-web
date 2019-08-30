class AddColumnToFolio < ActiveRecord::Migration[5.2]
  def change
    change_table :folios do |t|
      t.integer :order
    end
  end
end
