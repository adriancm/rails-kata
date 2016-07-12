module Api
  module V1
    class BaseController < ActionController::Base

      skip_before_action :authenticate_user!
      before_action :doorkeeper_authorize!

      helper_method :current_user

      rescue_from Exception, :with => :error_during_processing
      rescue_from ActiveRecord::RecordNotFound, :with => :not_found

      def not_found
        render json: { errors: "not found" }, :status => 404
      end

      def internal_server_error
        render status: 500, json: { errors: "internal server error" }
      end

      def current_user
        @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end

    end
  end
end
