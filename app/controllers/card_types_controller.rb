class CardTypesController < ApplicationController
    before_action :set_card_type, only: %i[ show update destroy ]
  
    # GET /card_types
    def index
      @card_types = CardType.all
  
      render json: @card_types
    end
  
    # GET /card_types/1
    def show
      render json: @card_type
    end
  
    # POST /card_types
    def create
      @card_type = CardType.new(card_type_params)
  
      if @card_type.save
        render json: @card_type, status: :created, location: @card_type
      else
        render json: @card_type.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /card_types/1
    def update
      if @card_type.update(card_type_params)
        render json: @card_type
      else
        render json: @card_type.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /card_types/1
    def destroy
      @card_type.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_card_type
        @card_type = CardType.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def card_type_params
        params.require(:card_type).permit(:name)
      end
  end
  