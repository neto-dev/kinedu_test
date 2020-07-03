class ActivityLog < ApplicationRecord
  belongs_to :activity
  belongs_to :assistang
  belongs_to :baby

  validates :baby_id, presence: true
  validates :assistant_id, presence: true
  validates :activity_id, presence: true
  validates :start_time, presence: true
  validates :stop_time, presence: true
  validates :duration, presence: true
  validates :comments, presence: false
end
