class ExportProjectsJob < ApplicationJob
  include ProjectsLoader

  queue_as :default

  def perform(*args)
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}: ExportProjectsJob starting"

    # Call project extractor in lib/projects_loader.rb
    update_all_projects

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}: ExportProjectsJob completed"
  end
end
