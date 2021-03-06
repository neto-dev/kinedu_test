class Api::BabiesController < ApiController
  # GET /api/babies
  def index
    @babies = Baby.all
    render json: @babies, status: :ok
  end

  # GET /api/{id}/activity_logs
  def activity_logs
    @activity_logs = ActivityLog.includes(:baby, :assistant).where(baby_id: params[:id])
    render json: @activity_logs, status: 200, each_serializer: BabyActivityLogSerializer
  end
end