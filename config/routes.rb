Rails.application.routes.draw do
  get 'jira_issues/index'
  get 'jira_issues/show'
  get 'jira_projects/index'
  get 'jira_projects/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
