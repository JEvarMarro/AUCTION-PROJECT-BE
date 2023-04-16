class Serie < ApplicationRecord
  validates :name, :release_date, presence: true
  has_many :serie_sets
  has_many :cards, through: :serie_sets
end
