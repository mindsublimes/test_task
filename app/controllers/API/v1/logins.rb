module API
  module V1
    class Logins < Grape::API
      include API::V1::Defaults
      require 'digest'
      resource :logins do
        desc 'Login User'
          
        post "login_user"do
          if params[:email].present?
            @user = User.find_by_email(params[:email])
            if @user.present?
              if @user.password == params[:password]
                @user.update(user_sign_in: true)
                # session[:user] = @user
                return_response = {statuscode: 200 , message: "User logged in successfully.", user: @user.id}
              else
                return_response = {statuscode: 400 , message: "Incorrect password."}
              end
            else
              return_response = {statuscode: 400 , message: "Incorrect email."}
            end
          else
            return_response = {statuscode: 400 , message: "Email or password are missing."}
          end
        end

        post "logout_user"do
          if params[:email].present?
            @user = User.find_by_email(params[:email])
            if @user.present?
              @user.update(user_sign_in: false)
              return_response = {statuscode: 200 , message: "User logged out successfully."}
            else
              return_response = {statuscode: 400 , message: "User doesn't exist."}
            end
          else
            return_response = {statuscode: 400 , message: "Email is missing."}
          end
        end

      end
    end
  end
end
