class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: %i[ show update destroy ]

   # GET /cards
  def index
    if serie_set_id
      @cards = Card.where(serie_set_id: serie_set_id)
    else
      @cards = Card.all
    end
    if name.present?
      formatted_name = name.downcase.gsub(/\s+/, "")
      @cards = @cards.where("REPLACE(LOWER(name), ' ', '') LIKE ?", "%#{formatted_name}%")
    end
    render json: { cards: ActiveModelSerializers::SerializableResource.new(@cards, each_serializer: CardSerializer).as_json }
  end

  # GET /cards/1
  def show
    render json: @card
  end

  # POST /cards
  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created, location: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def card_params
    params.require(:card).permit(:number, :name, :card_type_id, :card_rarity_id, :serie_id, :serie_set_id)
  end

  def serie_set_id
    params[:serie_set_id]
  end

  def name
    params[:name]
  end
end
