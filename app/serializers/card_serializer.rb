class CardSerializer < ActiveModel::Serializer

    attributes  :id,
                :image_url,
                :name,
                :number

    belongs_to :card_type
    belongs_to :card_rarity
    belongs_to :serie_set
end