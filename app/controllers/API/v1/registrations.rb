module API
  module V1
    class Registrations < Grape::API
      include API::V1::Defaults
      require 'digest'
      resource :registrations do
        desc 'Create a user'
        
        post "create_user"do
          if params[:email].present? && params[:password].present? && params[:confirm_password].present?
            user = User.find_by_email(params[:email])
            if user.present?
              return_response = {statuscode: 400 , message: "User already exists."}    
            else
              if params[:password] == params[:confirm_password] 
                @user = User.create({
                  email: params[:email],
                  password: params[:password],
                  confirm_password: params[:confirm_password],
                  user_sign_in: false
                })
                return_response = {statuscode: 200 , message: "User created successfully.", user: @user.id}
              else
                return_response = {statuscode: 400 , message: "Password does not match."}
              end
            end
          else
            return_response = {statuscode: 400 , message: "Email, password and password confirmation fields must exist."}
          end
        end
      end
    end
  end
end
