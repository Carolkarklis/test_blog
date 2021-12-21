# frozen_string_literal: true

module Api::V1
  class ApiController < ActionController::API
    before_action :authenticate_request

    def authenticate_request
      warden.authenticate!(:api_token)
    end
  end
end
