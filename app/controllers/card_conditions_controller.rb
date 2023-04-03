class CardConditionsController < ApplicationController
  before_action :set_card_condition, only: %i[ show update destroy ]

  # GET /card_conditions
  def index
    @card_conditions = CardCondition.all

    render json: @card_conditions
  end

  # GET /card_conditions/1
  def show
    render json: @card_condition
  end

  # POST /card_conditions
  def create
    @card_condition = CardCondition.new(card_condition_params)

    if @card_condition.save
      render json: @card_condition, status: :created, location: @card_condition
    else
      render json: @card_condition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /card_conditions/1
  def update
    if @card_condition.update(card_condition_params)
      render json: @card_condition
    else
      render json: @card_condition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /card_conditions/1
  def destroy
    @card_condition.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_condition
      @card_condition = CardCondition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_condition_params
      params.require(:card_condition).permit(:auction_item_id, :name)
    end
end
