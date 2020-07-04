class BabyActivityLogSerializer < ActiveModel::Serializer
  attribute :id, key: :activity_log_id
  attributes :baby_id, :assistant_name, :start_time
  attribute :stop_time, if: :condition?

  def assistant_name
    self.object.assistant.name
  end

  def condition?
    true if self.object.stop_time
  end

  def start_time
    self.object.start_time.nil? ? nil : self.object.start_time.to_time.utc.iso8601
  end

  def stop_time
    self.object.stop_time.nil? ? nil : self.object.stop_time.to_time.utc.iso8601
  end
end
