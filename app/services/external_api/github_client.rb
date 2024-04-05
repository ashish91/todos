module ExternalApi
  class GithubClient < ExternalApi::BaseClient

    BASE_URI = "https://api.github.com".freeze

    def initialize(token: Rails.application.credentials.github.token)
      super(base_uri: BASE_URI, default_headers: default_headers(token))
    end

    def current_user
      @http_api.get("/user")
    end

    private
      def default_headers(token)
        {
          "Accept" => "application/vnd.github+json",
          "Authorization" => "token #{token}",
        }
      end

  end
end
