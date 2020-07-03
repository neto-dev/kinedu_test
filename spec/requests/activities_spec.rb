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

     payload.each_with_index do |item, index|
      expect(item["id"]).to_not be_nil
      expect(item["name"]).to eq(activities[index]["name"])
      expect(item["description"]).to eq(activities[index]["description"])
     end
     expect(response).to have_http_status(200)
   end
  end
end
