Rails.application.routes.draw do
  get 'home/index'
  get 'jira_issues/index'
  get 'jira_issues/show'
  get 'jira_projects/index'
  get 'jira_projects/show'

  root to: "home#index"
end
