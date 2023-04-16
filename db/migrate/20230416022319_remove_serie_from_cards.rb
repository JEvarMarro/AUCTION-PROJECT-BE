class RemoveSerieFromCards < ActiveRecord::Migration[7.0]
  def change
    remove_column :cards, :serie_id, :uuid
  end
end
