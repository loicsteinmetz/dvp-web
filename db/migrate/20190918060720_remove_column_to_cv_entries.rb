class RemoveColumnToCvEntries < ActiveRecord::Migration[5.2]
  def change
    change_table :cv_entries do |t|
      t.remove :time
    end
  end
end
