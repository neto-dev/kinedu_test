class Api::ActivityLogsController < ApiController

  rescue_from Exception do |e|
    render json: { error: e.message }, status: :internal_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # POST /api/activity_logs
  def create
    @activity_log = ActivityLog.create!(create_params)
    render json: @activity_log, status: :created
  end

  # PUT /api/activity_logs/{id}
  def update
    @activity_log = ActivityLog.find(params[:id])
    @activity_log.update!(update_params)
    render json: @activity_log, status: :ok
  end

  private

  def create_params
    params.require(:activity_log).permit(:baby_id, :activity_id, :assistant_id, :start_time)
  end

  def update_params
    params.require(:activity_log).permit(:stop_time, :comments)
  end
end