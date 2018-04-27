class CreateMuseums < ActiveRecord::Migration[5.2]
  def change
    create_table :museums do |t|
      t.string :name, null:false
      t.string :location, null:false
      t.text :description
      t.date :founding_date
      t.string :url
      t.timestamps
    end
  end
end
