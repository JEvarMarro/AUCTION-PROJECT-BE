class ChangeFieldsToNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column :cards, :number, :integer, null: false
    change_column :cards, :name, :string, null: false
    change_column :cards, :image_url, :string, null: false
    change_column :auction_items, :current_price, :float, null: false
    change_column :auction_items, :minimum_bid, :float, null: false
    change_column :auction_items, :end_date, :datetime, null: false
    change_column :card_conditions, :name, :string, null: false
    change_column :card_rarities, :name, :string, null: false
    change_column :card_types, :name, :string, null: false
    change_column :card_types, :name, :string, null: false
    change_column :serie_sets, :name, :string, null: false
    change_column :serie_sets, :release_date, :date, null: false
    change_column :series, :name, :string, null: false
    change_column :series, :release_date, :date, null: false
  end
end
