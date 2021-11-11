module API
  module V1
    class Jobs < Grape::API
      include API::V1::Defaults
      require 'digest'
      resource :jobs do
        desc 'Jobs Queue'
          
        get "jobs_queue"do
          jobs = Job.order(priority: :asc)
          if jobs.present?
            return_response = {statuscode: 200 , message: "Jobs Listed."}
          else
            return_response = {statuscode: 400 , message: "Jobs not present."}
          end
        end

        post "create_jobs"do
          if params[:job_title].present?
            job = Job.find_by_job_title(params[:job_title])
            if job.present?
              return_response = {statuscode: 400 , message: "Job already exists."}
            else
              Job.create(
                  job_title: params[:job_title],
                  job_description: params[:job_description],
                  no_of_posts: params[:no_of_posts],
                  status: params[:status],
                  priority: params[:priority],
                  queue_time: params[:queue_time])
              return_response = {statuscode: 200 , message: "Job created successfully."}
            end
          else
            return_response = {statuscode: 400 , message: "Job title must required."}
          end
        end

      end
    end
  end
end
