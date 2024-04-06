require 'rails_helper'

RSpec.describe ExternalApi::TodosClient, type: :service do
  subject { ExternalApi::TodosClient.new }

  describe "#todos" do
    it "calls api and returns todos" do
      stub_request(:get, "http://localhost:3000/todos").
        to_return(
          status: 200,
          body: "[]",
          headers: {}
        )

      expect(subject.todos).to eq([])
    end
  end

  describe "#todo(:id)" do
    it "calls api and returns todo with :id" do
      stub_request(:get, "http://localhost:3000/todos/1").
        to_return(
          status: 200,
          body: "{\"id\":1,\"description\":\"Sample Todo\"}",
          headers: {}
        )

      expect(subject.todo(1)).to eq({ "id" => 1, "description" => "Sample Todo" })
    end
  end

  describe "#create_todo" do
    it "creates a new todo and returns the newly created todo" do
      stub_request(:post, "http://localhost:3000/todos").
        to_return(
          status: 201,
          body: "{\"id\":1,\"description\":\"Sample Todo\"}",
          headers: {}
        )

      expect(subject.create_todo(description: 'Sample Todo')).to eq({ "id" => 1, "description" => "Sample Todo" })
    end
  end

  describe "#update_todo(:id)" do
    it "updates todo with :id and returns the updated todo" do
      stub_request(:patch, "http://localhost:3000/todos/1").
        to_return(
          status: 200,
          body: "{\"id\":1,\"description\":\"Sample Todo Updated\"}",
          headers: {}
        )

      expect(subject.update_todo(1, description: 'Sample Todo Updated')).to eq({ "id" => 1, "description" => "Sample Todo Updated" })
    end
  end

  describe "#delete_todo(:id)" do
    it "deletes todo with :id" do
      stub_request(:delete, "http://localhost:3000/todos/1").
        to_return(
          status: 204,
          headers: {}
        )

      expect(subject.delete_todo(1)).to be_nil
    end
  end
end
