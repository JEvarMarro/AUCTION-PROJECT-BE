class AuctionItemSerializer < ActiveModel::Serializer

    attributes  :current_price,
                :minimum_bid,
                :end_date

    belongs_to :card
end  