class CreateFolios < ActiveRecord::Migration[5.2]
  def change
    create_table :folios do |t|
      t.string :title
      t.string :website
      t.string :type
      t.text :description
      t.text :techs
      t.text :description_mini

      t.timestamps
    end
  end
end
