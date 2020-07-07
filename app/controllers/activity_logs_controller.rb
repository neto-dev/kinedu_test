class ActivityLogsController < ApplicationController
  def index
    @activity_logs = ActivityLog.filter(params.slice(:baby, :assistant, :status))
  end
end