class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :job_description
      t.integer :no_of_posts
      t.integer :status, default: 0
      t.integer :priority
      t.datetime :queue_time
      t.timestamps
    end
  end
end
