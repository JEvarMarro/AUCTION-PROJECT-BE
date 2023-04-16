class SerieSet < ApplicationRecord
  validates :name, :release_date, :serie_id, :total_amount, presence: true
  belongs_to :serie
  has_many :cards
end
