class CreateCvEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :cv_entries do |t|
      t.string :time
      t.string :title
      t.string :sub

      t.timestamps
    end
  end
end
