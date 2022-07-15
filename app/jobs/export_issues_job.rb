class ExportIssuesJob < ApplicationJob
  include IssuesLoader

  queue_as :default

  def perform(*args)
    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}: ExportIssuesJob starting"

    # Call project extractor in lib/issues_loader.rb
    update_all_issues

    puts "#{Time.now().strftime('%F - %H:%M:%S.%L')}: ExportIssuesJob completed"  end
end
