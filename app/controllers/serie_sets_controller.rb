class SerieSetsController < ApplicationController
  before_action :set_serie_set, only: %i[ show update destroy ]

  # GET /serie_sets
  def index
    @serie_sets = SerieSet.all

    render json: @serie_sets
  end

  # GET /serie_sets/1
  def show
    render json: @serie_set
  end

  # POST /serie_sets
  def create
    @serie_set = SerieSet.new(serie_set_params)

    if @serie_set.save
      render json: @serie_set, status: :created, location: @serie_set
    else
      render json: @serie_set.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /serie_sets/1
  def update
    if @serie_set.update(serie_set_params)
      render json: @serie_set
    else
      render json: @serie_set.errors, status: :unprocessable_entity
    end
  end

  # DELETE /serie_sets/1
  def destroy
    @serie_set.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serie_set
      @serie_set = SerieSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def serie_set_params
      params.require(:serie_set).permit(:name, :description, :serie_id)
    end
end
