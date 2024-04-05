module ExternalApi
  class TodosClient < ExternalApi::BaseClient
    # client = ExternalApi::TodosClient.new(token: "api_key2")
    # client.todos
    # client.todo(1)
    # client.create_todo(description: "test")

    BASE_URI = "http://localhost:3000".freeze

    def initialize(token: "api_key2")
      super(base_uri: BASE_URI, default_headers: default_headers(token))
    end

    def todos(**kwargs)
      @http_api.get("/todos", query: kwargs)
    end

    def todo(id)
      @http_api.get("/todos/#{id}")
    end

    def create_todo(description:)
      @http_api.post("/todos", body: { todo: {description: description} })
    end

    def update_todo(id, description:)
      @http_api.patch("/todos/#{id}", body: { todo: {description: description} })
    end

    def delete_todo(id)
      @http_api.delete("/todos/#{id}")
    end

    private
      def default_headers(token)
        {
          "Authorization" => "Bearer #{token}",
          "Accept" => "application/json",
        }
      end

  end
end
