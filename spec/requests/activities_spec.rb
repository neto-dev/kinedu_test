require 'rails_helper'

RSpec.describe "Activities endpoint", type: :request do
  describe "GET /api/activities" do
   before { get '/api/activities' }

   it "should return OK" do
    payload = JSON.parse(response.body)
    expect(payload).to be_empty
    expect(response).to have_http_status(200)
   end

  end

  describe "whit data in the DataBase" do 
   let!(:activities) {create_list(:activity, 5)}
   
   before { get '/api/activities' }
   it "should return all the registered activities" do
     payload = JSON.parse(response.body)

     expect(payload.size).to eq(activities.size)
     expect(response).to have_http_status(200)
   end
  end
end
