class UsersController < ApplicationController
  def index
  end

  def sign_up
    @user = User.new
  end

  def create
    uri = URI.parse("http://localhost:3000/api/v1/registrations/create_user")
    email = params[:user][:email]
    password = params[:user][:password]
    confirm_password = params[:user][:confirm_password]
    data = {email: email, password: password, confirm_password: confirm_password }
    request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
    request.body  = data.to_json
    req_options   = { use_ssl: uri.scheme == 'https', read_timeout: 120, verify_mode: OpenSSL::SSL::VERIFY_PEER }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) { |http| http.request(request) }
    @results = JSON.parse(response.body)
    if @results["statuscode"] == 200
      session[:user] = @results["user"]
      # flash[:success]  =  @results["message"]
      redirect_to jobs_path
    # else
      # flash[:alert]    =  @results["message"]
      # redirect_to sign_up_users_path(@results)
    end
  end
  def sign_in;end

  def sign_in_user
    uri = URI.parse("http://localhost:3000/api/v1/logins/login_user")
    email = params[:email]
    password = params[:password]
    data = {email: email, password: password }
    request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
    request.body  = data.to_json
    req_options   = { use_ssl: uri.scheme == 'https', read_timeout: 120, verify_mode: OpenSSL::SSL::VERIFY_PEER }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) { |http| http.request(request) }
    @results = JSON.parse(response.body)
    if @results["statuscode"] == 200
      session[:user] = @results["user"]
      redirect_to jobs_path
      # flash[:success]  =  @results["message"]
    # else
      # flash[:alert]    =  @results["message"]
    end
    # redirect_to new_registrations_path(@results)
  end

  def sign_out
    uri = URI.parse("http://localhost:3000/api/v1/logins/logout_user")
    email = User.find_by(id: session[:user]).email
    data = {email: email}
    request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
    request.body  = data.to_json
    req_options   = { use_ssl: uri.scheme == 'https', read_timeout: 120, verify_mode: OpenSSL::SSL::VERIFY_PEER }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) { |http| http.request(request) }
    @results = JSON.parse(response.body)
    if @results["statuscode"] == 200
      session[:user] = nil
      redirect_to sign_in_users_path
      # flash[:success]  =  @results["message"]
    # else
      # flash[:alert]    =  @results["message"]
    end
    # redirect_to new_registrations_path(@results)
  end


end
