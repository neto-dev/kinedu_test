require 'rails_helper'

RSpec.describe Assistant, type: :model do
  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:name)
      should validate_presence_of(:group)
      should validate_presence_of(:address)
      should validate_presence_of(:phone)
    end

    it "validate relations" do
      should have_many(:activity_logs)
    end
  end
end
