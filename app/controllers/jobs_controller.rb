class JobsController < ApplicationController
  def index
    @jobs= Job.order(priority: :asc)
  end

  def new
    @job = Job.new
  end

  def create
    uri = URI.parse("http://localhost:3000/api/v1/jobs/create_jobs")
    job_title = params[:job][:job_title]
    job_description = params[:job][:job_description]
    no_of_posts = params[:job][:no_of_posts]
    status = params[:job][:status]
    priority = params[:job][:priority]
    queue_time = params[:job][:queue_time]
    data = { job_title: job_title,
             job_description: job_description,
             no_of_posts: no_of_posts,
             status: status,
             priority: priority,
             queue_time: queue_time
           }
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


end
