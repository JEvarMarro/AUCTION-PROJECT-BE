class AuctionItem < ApplicationRecord
  belongs_to :card
  belongs_to :card_condition
end
