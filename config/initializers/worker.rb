require 'sidekiq'
require 'sidekiq-scheduler'


Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class OurWorker
  include Sidekiq::Worker

  def perform
    time = Time.now.strftime("%H:%M")
    jobs = Job.where("Time(queue_time) LIKE ?", "#{time}%").order(priority: :asc)
    jobs.map{|job| perform_job(job)}
  end

  def perform_job(job)
    5.times.each do |count|
      Movie.create(movie_name: job.job_title)
    end
  end

end
