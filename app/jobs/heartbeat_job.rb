# app/jobs/heartbeat_job.rb
#
# This job runs in the background as a heartbeat and can be used to monitor
# if Sidekiq is running correctly.  It runs every 15 seconds and logs an alive
# message with a timestamp.
#
class HeartbeatJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sleep 15
    puts "EngIn App alive #{Time.now().strftime('%F - %H:%M:%S.%L')}"
  end
end