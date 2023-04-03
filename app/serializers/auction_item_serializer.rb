class AuctionItemSerializer < ActiveModel::Serializer

    attributes  :current_price,
                :end_date,
                :id,
                :minimum_bid
                

    belongs_to :card
    has_one :card_condition
end  