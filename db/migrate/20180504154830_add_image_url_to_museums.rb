class AddImageUrlToMuseums < ActiveRecord::Migration[5.2]
  def change
    add_column :museums, :image_url, :string
  end
end
