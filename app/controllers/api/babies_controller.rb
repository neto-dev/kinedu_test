class Api::BabiesController < ApplicationController
  # GET /api/babies
  def index
    @babies = Baby.all
    render json: @babies, status: :ok
  end
end