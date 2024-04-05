module ExternalApi
  class BaseClient

    def initialize(base_uri:, default_headers: {})
      @http_api = HttpApiService.new(base_uri: base_uri, default_headers: default_headers)
    end
  end
end
