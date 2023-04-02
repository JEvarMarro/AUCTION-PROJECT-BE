class Card < ApplicationRecord
  belongs_to :card_type
  belongs_to :card_rarity
  belongs_to :serie
  belongs_to :serie_set

end
