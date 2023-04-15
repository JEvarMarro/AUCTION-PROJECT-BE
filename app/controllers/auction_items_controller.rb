class AuctionItemsController < ApplicationController
  before_action :set_auction_item, only: %i[ show update destroy ]

  # GET /auction_items
  def index
    @auction_items = AuctionItem.joins(:card).includes(card: [:card_type, :card_rarity, :serie, :serie_set])
    @auction_items = @auction_items.where("LOWER(cards.name) LIKE ?", "%#{search_term.downcase}%") if search_term
    @auction_items = @auction_items.where(cards: { serie_id: serie_id }) if serie_id
    @auction_items = @auction_items.where(cards: { serie_set_id: serie_set_id }) if serie_set_id
    @auction_items = @auction_items.where(cards: { card_rarity_id: card_rarity_id }) if card_rarity_id
    @auction_items = @auction_items.where(cards: { card_type_id: card_type_id }) if card_type_id
    @auction_items = @auction_items.where(card_condition_id: card_condition_id) if card_condition_id
    render json: @auction_items, include: ['card.card_type', 'card.card_rarity', 'card.serie', 'card.serie_set', 'card_condition']
  end

  # GET /auction_items/1
  def show
    render json: @auction_item, include: ['card.card_type', 'card.card_rarity', 'card.serie', 'card.serie_set', 'card_condition']
  end

  # POST /auction_items
  def create
    @auction_item = AuctionItem.new(auction_item_params)

    if @auction_item.save
      render json: @auction_item, status: :created, location: @auction_item
    else
      render json: @auction_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /auction_items/1
  def update
    if @auction_item.update(auction_item_params)
      render json: @auction_item
    else
      render json: @auction_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /auction_items/1
  def destroy
    @auction_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction_item
      @auction_item = AuctionItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auction_item_params
      params.require(:auction_item).permit(:card_id, :current_price, :minimum_bid, :end_date, :card_condition_id)
    end

    def serie_id
      params[:serie_id]
    end

    def serie_set_id
      params[:serie_set_id]
    end

    def card_rarity_id
      params[:card_rarity_id]
    end

    def card_type_id
      params[:card_type_id]
    end

    def card_condition_id
      params[:card_condition_id]
    end

    def search_term
      params[:search_term]
    end
end
