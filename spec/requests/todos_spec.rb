require 'rails_helper'

RSpec.describe "Todos", type: :request do
  let(:api_key) { "api_key2" }
  let(:sample_todo) { create(:sample_todo) }

  describe "GET /index" do
    it "returns success for todos" do
      get todos_url, headers: { "Authorization" => "token #{api_key}" }
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /todos/:id" do

    it "shows todo with :id" do
      todo = Todo.find(sample_todo.id)
      get todos_url(todo), headers: { "Authorization" => "token #{api_key}" }
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /todos/:id/edit" do
    it "edit response for todo with :id" do
      todo = Todo.find(sample_todo.id)
      get edit_todo_url(todo), headers: { "Authorization" => "token #{api_key}" }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /todos" do
    it "creates todo with :id" do
      expect {
        post todos_url, params: { todo: { description: "Sample todo" } }, headers: { "Authorization" => "token #{api_key}" }
      }.to change(Todo, :count).by(1)

      expect(response).to have_http_status(201)
    end
  end

  describe "PATCH /todos/:id" do
    it "creates todo with :id" do
      todo = Todo.find(sample_todo.id)
      patch todo_url(todo), params: { todo: { description: "Sample todo" } }, headers: { "Authorization" => "token #{api_key}" }

      expect(todo.reload.description).to eq("Sample todo")
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /todos/:id" do
    it "creates todo with :id" do
      todo = create(:sample_todo)
      expect {
        delete todo_url(todo), headers: { "Authorization" => "token #{api_key}" }
      }.to change(Todo, :count).by(-1)

      expect(Todo.find_by(id: todo.id)).to be_nil
      expect(response).to have_http_status(204)
    end
  end
end
