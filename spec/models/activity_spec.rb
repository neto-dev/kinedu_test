require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:name)
      should validate_presence_of(:description)
    end

    it "validate relations" do
      should have_many(:activity_logs)
    end
  end
end
