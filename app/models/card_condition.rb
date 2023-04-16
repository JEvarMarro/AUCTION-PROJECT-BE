class CardCondition < ApplicationRecord
  validates :name, presence: true
end
