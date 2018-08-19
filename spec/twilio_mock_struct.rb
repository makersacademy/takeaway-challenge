class TwilioMockStruct

  attr_accessor :message, :sid

  def initialize(_account_sid, _auth_token)
    @sid = "Mock Sid"
  end

  def messages
    self
  end

  def create(body:, to:, from:)
    @message = { body: body, to: to, from: from }
    self
  end

end
