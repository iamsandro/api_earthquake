require 'rails_helper'

RSpec.describe Api::V1::FeaturesController, type: :controller do
    describe "index" do

        it "get all data " do
            get :index, params: { page: 1, per_page: 5 }
            expect(response).to have_http_status(200)
        end

        it "Attempting to get all data with an incorrect page field " do
            get :index, params: { page: "aa", per_page: 5 }
            expect(response).to have_http_status(400)
        end

        it "Attempting to get all data with an incorrect page field " do
            get :index, params: { page: -45, per_page: 5 }
            expect(response).to have_http_status(400)
        end

        it "Attempting to get all data with an incorrect per_page field " do
            get :index, params: { page: 1, per_page: "aa" }
            expect(response).to have_http_status(400)
        end

        it "Attempting to get all data with an incorrect per_page field " do
            get :index, params: { page: 1, per_page: 0 }
            expect(response).to have_http_status(400)
        end

    end
  end
  