require "net/http"

module HttpStrategy
  class NetHttpService

    def initialize(base_uri:, default_headers: {})
      @default_headers = default_headers
      @base_uri = base_uri
    end

    def get(path, query: {}, headers: {})
      make_request Net::HTTP::Get, path, query: query
    end

    def post(path, query: {}, headers: {}, body: {})
      make_request Net::HTTP::Post, path, query: query, body: body
    end

    def patch(path, query: {}, headers: {}, body: {})
      make_request Net::HTTP::Patch, path, query: query, body: body
    end

    def put(path, query: {}, headers: {}, body: {})
      make_request Net::HTTP::Put, path, query: query, body: body
    end

    def delete(path, query: {}, headers: {})
      make_request Net::HTTP::Delete, path, query: query
    end

    private
      def build_uri(path, query)
        uri = URI("#{@base_uri}#{path}")
        uri.query = Rack::Utils.build_query(query) if query

        uri
      end

      def make_request(request_type, path, query: {}, headers: {}, body: {})
        uri = build_uri(path, query)

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.instance_of?(URI::HTTPS)

        headers = @default_headers.merge(headers)
        request = request_type.new(uri.request_uri, headers)
        if body.present?
          request.body = body.to_json
          request["Content-Type"] = "application/json"
        end

        response = http.request(request)
        case response.code
        when "200", "201", "202", "203", "204"
          JSON.parse(response.body) if response.body.present?
        else
          raise Error, response.body
        end
      end

  end
end
