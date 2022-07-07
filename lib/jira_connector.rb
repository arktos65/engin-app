require 'rubygems'
require 'jira-ruby'

# Shared methods for consuming Jira resources
module Engin
  class JiraConnector
    # Options required for Basic authentication type
    def basic_auth
      options = {
        :username           => "username",
        :password           => "password",
        :site               => "url",
        :context_path       => "",
        :auth_type          => :basic
      }
      return options
    end

    # Options required for Cookie based authentication type
    def cookie_auth
      options = {
        :username           => "username",
        :password           => "password",
        :site               => "url",
        :context_path       => "",
        :auth_type          => :cookie,
        :use_cookies        => true,
        :additional_cookies => ['AUTH=vV7uzixt0SScJKg7']
      }
      return options
    end

    # Options required for Personal Access token authentication type
    def token_auth
      api_token = "insert token here"
      options = {
        :site               => "url",
        :context_path       => "",
        :auth_type          => :basic,
        :default_headers    => { 'Authorization' =>  "Bearer #{api_token}"}
      }
      return options
    end
  end
end
