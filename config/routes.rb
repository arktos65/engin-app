Rails.application.routes.draw do
  get 'home/index'

  resources :jira_projects, only: [:index, :show], path: '/projects' do
    resources :jira_issues, only: [:index, :show], path: '/issues'
  end

  root to: "home#index"
end
