module API
  module V1
    class Base < Grape::API
      # mount API::V1::Registrations
      mount Jobs
      mount Registrations
      mount Logins
      # mount API::V1::AnotherResource
    end
  end
end
