require 'rails_helper'
require 'byebug'

RSpec.describe "Activities Logs endpoint", type: :request do
  describe "POST /api/activity_logs" do
    let!(:baby) { create(:baby) }
    let!(:assistant) { create(:assistant) }
    let!(:activity) { create(:activity) }
    it "should create a activity_log" do
      req_payload = {
        activity_log: {
          baby_id: baby.id,
          assistant_id: assistant.id,
          activity_id: activity.id,
          start_time: Faker::Time.between_dates(from: Date.today, to: Date.today, period: :morning),
        }
      }
      post "/api/activity_logs", params: req_payload

      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to_not be_nil
      expect(response).to have_http_status(:created)
    end

    it "should return error message on invalid activity_log" do
      req_payload = {
        activity_log: {
          assistant_id: assistant.id,
          activity_id: activity.id,
          start_time: Faker::Time.between_dates(from: Date.today, to: Date.today, period: :morning),
        }
      }

      post "/api/activity_logs", params: req_payload

      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["error"]).to_not be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT /api/activity_logs/{id}" do
    let!(:activity_log) { create(:activity_log) }
    
    it "should update a activity_log" do
      req_payload = {
        activity_log: {
          stop_time: Faker::Time.between_dates(from: Date.today, to: Date.today, period: :afternoon),
          description:"Test Description"
        }
      }

      put "/api/activity_logs/#{activity_log.id}", params: req_payload

      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to eq(activity_log.id)
      expect(response).to have_http_status(:ok)
    end

    it "should return duration value" do
      req_payload = {
        activity_log: {
          stop_time: Faker::Time.between_dates(from: Date.today, to: Date.today, period: :afternoon),
          description:"Test Description"
        }
      }

      put "/api/activity_logs/#{activity_log.id}", params: req_payload

      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["duration"]).to_not be_nil
      expect(response).to have_http_status(:ok)
    end

    it "should return error message when stop time it's equal or less start time and when stop time it's invalid datetime" do
      req_payload = {
        activity_log: {
          stop_time: activity_log.start_time,
          description:"Test Description"
        }
      }

      put "/api/activity_logs/#{activity_log.id}", params: req_payload

      payload = JSON.parse(response.body)
      
      expect(payload).to_not be_empty
      expect(payload["error"]).to_not be_nil
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "should return error message on invalid activity_log" do
      req_payload = {
        activity_log: {
          stop_time: nil,
          description:"Test Description"
        }
      }

      put "/api/activity_logs/#{activity_log.id}", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["error"]).to_not be_nil
      expect(response).to have_http_status(:unprocessable_entity)
    end

    
  end
end
