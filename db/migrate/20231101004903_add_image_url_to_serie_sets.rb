class AddImageUrlToSerieSets < ActiveRecord::Migration[7.0]
  def change
    add_column :serie_sets, :image_url, :string
  end
end
