class CreateTimeCvs < ActiveRecord::Migration[5.2]
  def change
    create_table :time_cvs do |t|
      t.string :date
      t.timestamps
    end
  end
end
