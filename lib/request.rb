class Request
  attr_reader :channel, :from, :body, :datetime

  def initialize(channel:, from:, body:, datetime:)
    @channel = channel
    @from = from
    @body = body
    @datetime = datetime
  end

  def ==(request)
    self.channel == request.channel &&
    self.from == request.from &&
    self.body == request.body &&
    self.datetime == request.datetime
  end
end
