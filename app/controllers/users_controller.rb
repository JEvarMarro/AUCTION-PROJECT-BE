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
    user = User.find user_id
    @collection = user.collections
    render json: {
      collection: ActiveModelSerializers::SerializableResource.new(
        @collection, each_serializer: CollectionSerializer, include:
          ['card.card_type', 'card.card_rarity']
      ).as_json
    }
  end

  
  def add_set
    set = SerieSet.find serie_set_id
    existing_card_ids = current_user.cards.pluck(:id)
    new_card_ids = set.cards.where.not(id: existing_card_ids).pluck(:id)
    current_user.card_ids += new_card_ids
    @collection = current_user.collections
    render json: { collection: ActiveModelSerializers::SerializableResource.new(@collection, each_serializer: CollectionSerializer).as_json }
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'El set no existe' }, status: :not_found
  end

  def remove_set
    set = SerieSet.find serie_set_id
    new_cards = current_user.cards.where.not(serie_set_id: set.id)
    current_user.update(cards: new_cards)
    @collection = current_user.collections
    render json: { collection: ActiveModelSerializers::SerializableResource.new(@collection, each_serializer: CollectionSerializer).as_json }
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
end
