require "forwardable"
require_relative "http_strategy/net_http_service.rb"

class HttpApiService
  extend Forwardable

  def_delegators :@http_strategy, :get, :post, :patch, :delete

  def initialize(base_uri:, default_headers: {"Accept" => "application/json"})
    @http_strategy = HttpStrategy::NetHttpService.new(
      base_uri: base_uri,
      default_headers: default_headers
    )
  end

end
