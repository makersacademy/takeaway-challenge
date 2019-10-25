class RequestHandler
  attr_reader :body, :from

  def initialize(params)
    @body = params['Body']
    @from = params['From']
  end

  def response

  end
end