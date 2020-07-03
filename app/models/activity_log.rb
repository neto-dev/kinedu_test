class ActivityLog < ApplicationRecord
  belongs_to :activity
  belongs_to :assistant
  belongs_to :baby

  validates :baby_id, presence: true, on: :create
  validates :assistant_id, presence: true, on: :create
  validates :activity_id, presence: true, on: :create
  validates :start_time, presence: true, on: :create
  validates :stop_time, presence: true, on: :update

  validate :stop_time_after_start_time

  before_update do
    self.duration = ( self.stop_time - self.start_time) / 1.minutes
  end

  private

  def stop_time_after_start_time
    return if stop_time.blank? || start_time.blank?

    if stop_time <= start_time
      errors.add(:stop_time, "must be after the start time")
    end
 end
end
