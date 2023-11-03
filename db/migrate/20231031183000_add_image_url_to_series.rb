class AddImageUrlToSeries < ActiveRecord::Migration[7.0]
  def change
    add_column :series, :image_url, :string
  end
end
