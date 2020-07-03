require 'rails_helper'
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
      expect(response).to have_http_status(200)
    end
  end
 
  # describe "GET /api/babies/{id}/activity_logs" do
   
  # end
end
