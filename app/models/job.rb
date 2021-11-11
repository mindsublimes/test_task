class Job < ApplicationRecord
  enum status: [:waiting, :done, :in_progress, :failed]
  enum priority: [:critical, :high, :low]
end
