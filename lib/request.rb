class Request
  attr_reader :channel, :from, :body, :datetime

  def initialize(channel:, from:, body:, datetime:)
    @channel = channel
    @from = from
    @body = body
    @datetime = datetime
  end
end
