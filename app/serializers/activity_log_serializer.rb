class ActivityLogSerializer < ActiveModel::Serializer
  attributes :id, :baby_id, :activity_id, :assistant_id, :start_time, :stop_time, :duration, :comments

  def start_time
    self.object.start_time.nil? ? nil : self.object.start_time.to_time.utc.iso8601
  end

  def stop_time
    self.object.stop_time.nil? ? nil : self.object.stop_time.to_time.utc.iso8601
  end
end
