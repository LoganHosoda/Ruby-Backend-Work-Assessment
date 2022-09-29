module Api
  class PingController < ApplicationController
    # GET /api/ping
    def index
      render json: { success: true }, status: 200
    end
  end
end
