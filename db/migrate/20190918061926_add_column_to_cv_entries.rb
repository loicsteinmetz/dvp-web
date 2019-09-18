class AddColumnToCvEntries < ActiveRecord::Migration[5.2]
  def change
    change_table :cv_entries do |t|
      t.belongs_to :date, class_name: 'CvTime'
    end
  end
end
