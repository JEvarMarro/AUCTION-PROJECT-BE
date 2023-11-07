class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :card

  validates :card_id, uniqueness: { scope: :user_id, message: "Ya tienes esta carta en tu colección" }
end
