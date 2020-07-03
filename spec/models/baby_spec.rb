require 'rails_helper'

RSpec.describe Baby, type: :model do
  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:name)
      should validate_presence_of(:birthday)
      should validate_presence_of(:mother_name)
      should validate_presence_of(:father_name)
      should validate_presence_of(:address)
      should validate_presence_of(:phone)
    end

    it "validate relations" do
      should have_many(:activity_logs)
    end
  end
end
