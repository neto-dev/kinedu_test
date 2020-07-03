require 'rails_helper'

RSpec.describe ActivityLog, type: :model do
  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:baby_id)
      should validate_presence_of(:assistant_id)
      should validate_presence_of(:activity_id)
      should validate_presence_of(:start_time)
      should validate_presence_of(:stop_time)
      should validate_presence_of(:duration)
    end
  end
end
