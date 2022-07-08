require 'jira-ruby'

module JiraConnect
  def get_connector
    # NOTE: the token should not be encoded
    api_token = ENV['JIRA_API_KEY']

    connect_options = {
      :site               => ENV['JIRA_SITE'],
      :context_path       => ENV['JIRA_CONTEXT'],
      :auth_type          => :basic,
      :default_headers    => { 'Authorization' =>  "Bearer #{api_token}"}
    }
    return connect_options
  end
end
