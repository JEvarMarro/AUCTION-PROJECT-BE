class CreateAuctionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :auction_items, id: :uuid do |t|
      t.references :card, null: false, foreign_key: true, type: :uuid
      t.references :card_condition, null: false, foreign_key: true, type: :uuid
      t.float :current_price
      t.float :minimum_bid
      t.datetime :end_date

      t.timestamps
    end
  end
end
