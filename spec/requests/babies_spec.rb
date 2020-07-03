require 'rails_helper'
require 'byebug'
RSpec.describe "Babies endpoint", type: :request do
  describe "GET /api/babies" do
   before { get '/api/babies' }

   it "should return OK" do
    payload = JSON.parse(response.body)
    
    expect(payload).to be_empty
    expect(response).to have_http_status(200)
   end

  end
  
  describe "whit data in the DataBase" do 
    let!(:babies) {create_list(:baby, 5)}
    
    before { get '/api/babies' }
    it "should return all the registered babies" do
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(babies.size)
      payload.each_with_index do |item, index|
        expect(item["name"]).to eq(babies[index]["name"])
        expect(item["months_old"]).to_not be_nil
        expect(item["months_old"]).to be_a(Numeric)
        expect(item["birthday"]).to eq(babies[index]["birthday"].to_formatted_s(:db))
        expect(item["mother_name"]).to eq(babies[index]["mother_name"])
        expect(item["father_name"]).to eq(babies[index]["father_name"])
        expect(item["address"]).to eq(babies[index]["address"])
        expect(item["phone"]).to eq(babies[index]["phone"])
      end
      expect(response).to have_http_status(200)
    end
  end
 
  # describe "GET /api/babies/{id}/activity_logs" do
   
  # end
end
