class FakeTwilio
  Message = Struct.new(:body)

  @messages = []

  class << self
    attr_accessor :messages
  end

  def initialize(_account_sid, _auth_token)
  end

  def messages
    self
  end

  def create(from:, to:, body:)
    self.class.messages.push(Message.new(body))
  end
end
