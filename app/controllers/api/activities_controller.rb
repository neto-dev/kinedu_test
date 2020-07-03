class Api::ActivitiesController < ApplicationController
  # GET /api/activities
  def index
    @activities = Activity.all
    render json: @activities, status: :ok
  end
end