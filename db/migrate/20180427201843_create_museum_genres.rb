class CreateMuseumGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :museum_genres do |t|
      t.belongs_to :museum
      t.belongs_to :genre

      t.timestamps
    end
  end
end
