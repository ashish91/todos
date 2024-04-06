require 'rails_helper'

RSpec.describe ExternalApi::GithubClient, type: :service do
  subject { ExternalApi::GithubClient.new }
  let(:sample_github_api_response) {
    {
      "login"=>"ashish91",
      "id"=>2291064,
      "node_id"=>"MDQ6VXNlcjIyOTEwNjQ=",
      "avatar_url"=>"https://avatars.githubusercontent.com/u/2291064?v=4",
      "gravatar_id"=>"",
      "url"=>"https://api.github.com/users/ashish91",
      "html_url"=>"https://github.com/ashish91",
      "followers_url"=>"https://api.github.com/users/ashish91/followers",
      "following_url"=>"https://api.github.com/users/ashish91/following{/other_user}",
      "gists_url"=>"https://api.github.com/users/ashish91/gists{/gist_id}",
      "starred_url"=>"https://api.github.com/users/ashish91/starred{/owner}{/repo}",
      "subscriptions_url"=>"https://api.github.com/users/ashish91/subscriptions",
      "organizations_url"=>"https://api.github.com/users/ashish91/orgs",
      "repos_url"=>"https://api.github.com/users/ashish91/repos",
      "events_url"=>"https://api.github.com/users/ashish91/events{/privacy}",
      "received_events_url"=>"https://api.github.com/users/ashish91/received_events",
      "type"=>"User",
      "site_admin"=>false,
      "name"=>"Ashish Gaur",
      "company"=>nil,
      "blog"=>"codingwithaglassofmilk.netlify.app",
      "location"=>"India",
      "email"=>nil,
      "hireable"=>nil,
      "bio"=>nil,
      "twitter_username"=>"snyder_91",
      "public_repos"=>47,
      "public_gists"=>71,
      "followers"=>9,
      "following"=>3,
      "created_at"=>"2012-09-06T09:48:16Z",
      "updated_at"=>"2024-03-17T07:21:44Z"
    }
  }

  describe "#current_user" do
    it "calls api and returns todos" do

      stub_request(:get, "https://api.github.com/user").
        to_return(
          status: 200,
          body: sample_github_api_response.to_json,
          headers: {}
        )

      res = subject.current_user
      expect(subject.current_user['login']).to eq('ashish91')
    end
  end
end
