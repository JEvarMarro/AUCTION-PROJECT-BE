class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => :collection

  def add_card
    card = Card.find_by(id: params[:card_id])
    if card.nil?
      render json: { error: 'La carta no existe' }, status: :not_found
    elsif current_user.cards.include?(card)
      render json: { error: 'La carta ya está en tu colección' }, status: :unprocessable_entity
    else
      current_user.cards << card
      render json: { success: 'Carta agregada a tu colección correctamente' }
    end
  end

  def remove_card
    collection = current_user.collections.find_by(card_id: params[:card_id])
    if collection
      collection.destroy
      render json: { success: 'Carta removida de tu colección' }
    else
      render json: { error: 'La carta no se encuentra en tu colección' }, status: :not_found
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'La carta no existe' }, status: :not_found
  end

  def collection
    render json: series
  end

  def add_set
    set = SerieSet.find serie_set_id
    existing_card_ids = current_user.cards.pluck(:id)
    new_card_ids = set.cards.where.not(id: existing_card_ids).pluck(:id)
    current_user.card_ids += new_card_ids
    render json: { collection: series }
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'El set no existe' }, status: :not_found
  end

  def remove_set
    set = SerieSet.find serie_set_id
    new_cards = current_user.cards.where.not(serie_set_id: set.id)
    current_user.update(cards: new_cards)
    render json: { collection: series }
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'El set no existe' }, status: :not_found
  end

  private

  def user_params
    params.require(:user).permit(:serie_set_id, :user_id, :card_id)
  end

  def card_id
    user_params[:card_id]
  end

  def user_id
    user_params[:user_id]
  end

  def serie_set_id
    user_params[:serie_set_id]
  end

  def user
    User.find user_id
  end

  def user_cards
    user.cards
  end

  def series
    grouped_cards = user_cards.includes(serie_set: :serie).group_by { |card| card.serie_set.serie_id }
    series = grouped_cards.map do |serie_id, cards|
      serie = cards.first.serie_set.serie
      serie_sets = cards.group_by(&:serie_set_id).map do |serie_set_id, cards|
        serie_set = cards.first.serie_set
        {
          serie_set_id: serie_set.id,
          serie_set_set_id: serie.id,
          serie_set_name: serie_set.name,
          serie_set_image_url: serie_set.image_url,
          cards: cards.map do |card|
            {
              id: card.id,
              name: card.name,
              image_url: card.image_url,
              number: card.number,
              rarity: card.card_rarity,
              serie_id: serie.id,
              set_id: serie_set.id
            }
          end
        }
      end
      {
        serie_id: serie.id,
        serie_name: serie.name,
        serie_image_url: serie.image_url,
        serie_sets: serie_sets
      }
    end
    { collection: series }
  end
end
