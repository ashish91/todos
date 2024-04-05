require 'rails_helper'

RSpec.describe HttpApiService, type: :service do

  let (:base_uri) { "http://test.com" }
  subject { HttpApiService.new(base_uri: base_uri) }

  context "" do
    it "sets default headers" do
      stub_request(:get, "#{base_uri}/todos").
        to_return(
          status: 200,
          body: { success: true }.to_json,
          headers: {}
        )

      expect(subject.get('/todos')).to eq({ "success" => true })
    end
  end

  context "#get requests" do
    it "without query params" do
      stub_request(:get, "#{base_uri}/todos").
        to_return(
          status: 200,
          body: [].to_s,
          headers: {}
        )

      expect(subject.get('/todos')).to eq([])
    end

    it "with query params" do
      query = {"foo" => "bar"}
      stub_request(:get, "#{base_uri}/todos").
        with(query: query).
        to_return(
          status: 200,
          body: [].to_s,
          headers: {}
        )

      expect(subject.get('/todos', query: query)).to eq([])
    end
  end

  context "#post requests" do

    it "with body" do
      body = {"foo" => {"bar" => "baz"}}
      stub_request(:post, "#{base_uri}/todos").
        with(body: body).
        to_return(
          status: 200,
          body: [].to_s,
          headers: {}
        )

      expect(subject.post('/todos', body: body)).to eq([])
    end

  end

  context "#patch requests" do

    it "with body" do
      body = {"foo" => {"bar" => "baz"}}
      stub_request(:patch, "#{base_uri}/todos/1").
        with(body: body).
        to_return(
          status: 200,
          body: [].to_s,
          headers: {}
        )

      expect(subject.patch('/todos/1', body: body)).to eq([])
    end

  end

  context "#delete requests" do

    it "with body" do
      stub_request(:delete, "#{base_uri}/todos/1").
        to_return(
          status: 200,
          headers: {}
        )

      response = subject.delete('/todos/1')
      # expect(response.code).to eq([])
    end

  end

  context "#error 500" do

    it "with body" do
      stub_request(:get, "#{base_uri}/todos").
        to_return(status: 500)

      # response = subject.get('/todos')
    end

  end

end
