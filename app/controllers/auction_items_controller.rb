class AuctionItemsController < ApplicationController
  before_action :set_auction_item, only: %i[ show update destroy ]

  # GET /auction_items
  def index
    @auction_items = AuctionItem.includes(card: [:card_type, :card_rarity, :serie, :serie_set])
    render json: @auction_items, include: ['card.card_type', 'card.card_rarity', 'card.serie', 'card.serie_set']
  end

  # GET /auction_items/1
  def show
    render json: @auction_item
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
      params.require(:auction_item).permit(:card_id, :current_price, :minimum_bid, :end_date)
    end
end
