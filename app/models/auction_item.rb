class AuctionItem < ApplicationRecord
  validates :card_id, :card_condition_id, :current_price, :minimum_bid, :end_date, presence: true

  belongs_to :card
  belongs_to :card_condition
end
