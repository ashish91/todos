class GithubClient < ApplicationClient
  BASE_URI = "https://api.github.com"

  def initialize
    super(token: Rails.application.credentials.github.token)
  end

  def current_user
    get "/user"
  end

  def default_headers
    {
      "Accept" => "application/vnd.github+json",
      "Authorization" => "token #{self.token}",
    }
  end
end
