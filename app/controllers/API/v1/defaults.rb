module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix "api"
        version "v1", using: :path
        default_format :json
        format :json
      end

      def self.invalid_credentials_response
        {
            statusCode: 200,
            isSuccess: false,
            message: "Invalid Credentials",
            result: nil
        }
      end

      def self.email_in_use_response
        {
            statusCode: 200,
            isSuccess: false,
            message: "Email already in use",
            result: nil
        }
      end

      def self.profile_creation_error_response
        {
            statusCode: 200,
            isSuccess: false,
            message: "Error creating user profile",
            result: nil
        }
      end

      def self.send_success_response(status,success_message,result=nil)
        {
            statusCode: status,
            isSuccess: true,
            message: success_message,
            result: result || nil
        }
      end

      def self.send_error_response(status, errors)
        {
            statusCode: status,
            isSuccess: false,
            errors: errors
        }
      end

      def self.generate_user_pass
        Devise.friendly_token.first(8)
      end

    end
  end
end
