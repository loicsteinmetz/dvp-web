class ChangeFolios < ActiveRecord::Migration[5.2]
  def change
    change_table :folios do |t|
      t.remove :type
      t.string :work
    end
  end
end
