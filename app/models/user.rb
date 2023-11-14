class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :collections
  has_many :cards, through: :collections
  has_many :serie_sets, through: :cards

  def series
    Serie.joins(serie_sets: { cards: :collections }).where(collections: { user_id: id }).distinct
  end
end
