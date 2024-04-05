class HttpApiResponse

  def initialize(response)
    @response = response
  end

  def code
    @response.code
  end

  def body
    return {} if response.body.present?
    JSON.parse(response.body)
  end

  def success?
  end

  def failure?
  end

end
