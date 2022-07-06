FactoryBot.define do
  factory :jira_issue do
    jira_issue_id { Faker::Number.between(1000..9000) }
    jira_project_id { nil }
    issue_key { Faker::String.random(length: 3) + self.jira_issue_id.to_s }
    issue_url { Faker::Internet.url }
    issue_title { Faker::Lorem.words(number: 5) }
    issue_status { "Open" }
    issue_type { "Story" }
    story_points { Faker::Number.between(1..5) }
    issue_created { "2022-07-05 11:38:38" }
    issue_updated { "2022-07-05 11:38:38" }
  end
end
