class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :body, null:false
      t.integer :rating, null:false
      t.belongs_to :museum, null:false
      t.belongs_to :user, null:false

      t.timestamps
    end
  end
end
