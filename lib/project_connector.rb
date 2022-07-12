module ProjectConnector
  # For security reasons, the values for the connect options should be stored
  # as environment variables and NEVER included in source code.
  def get_options
    # Using an API token associated with a Jira user account
    connect_options = {
      :username           => ENV['JIRA_USER'],
      :password           => ENV['JIRA_API_KEY'],
      :site               => ENV['JIRA_SITE'],
      :context_path       => ENV['JIRA_CONTEXT'],
      :auth_type          => :basic,
      :read_timeout       => 120
    }
    return connect_options
  end
end
