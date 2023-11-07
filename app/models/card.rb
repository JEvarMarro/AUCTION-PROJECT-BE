class Card < ApplicationRecord
  validates :number, :name, :image_url, :card_type_id, :card_rarity_id, :serie_set_id, presence: true

  belongs_to :card_type
  belongs_to :card_rarity
  belongs_to :serie_set

  has_many :collections
  has_many :users, through: :collections
end
