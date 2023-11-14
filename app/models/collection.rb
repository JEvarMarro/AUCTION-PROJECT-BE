class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :card

  has_many :serie_sets, through: :card
  validates :card_id, uniqueness: { scope: :user_id, message: "Ya tienes esta carta en tu colección" }
end
