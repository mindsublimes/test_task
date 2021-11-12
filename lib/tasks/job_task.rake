namespace :job_task do
  task :job_task => :environment do
    OurWorker.perform_async
  end
end
