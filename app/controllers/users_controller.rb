class UsersController < ApplicationController
  before_action :authenticate_user!

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
end
