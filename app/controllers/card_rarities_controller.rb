class CardRaritiesController < ApplicationController
    before_action :set_card_rarity, only: %i[ show update destroy ]
  
    # GET /card_rarities
    def index
      @card_rarities = CardRarity.all
  
      render json: @card_rarities
    end
  
    # GET /card_rarities/1
    def show
      render json: @card_rarity
    end
  
    # POST /card_rarities
    def create
      @card_rarity = CardRarity.new(card_rarity_params)
  
      if @card_rarity.save
        render json: @card_rarity, status: :created, location: @card_rarity
      else
        render json: @card_rarity.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /card_rarities/1
    def update
      if @card_rarity.update(card_rarity_params)
        render json: @card_rarity
      else
        render json: @card_rarity.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /card_rarities/1
    def destroy
      @card_rarity.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_card_rarity
        @card_rarity = CardRarity.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def card_rarity_params
        params.require(:card_rarity).permit(:name)
      end
  end
  