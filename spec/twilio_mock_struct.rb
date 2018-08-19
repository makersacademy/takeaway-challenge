class TwilioMockStruct

  attr_accessor :message, :sid

  def initialize(account_sid, auth_token)
    @sid = "Mock Sid"
  end

  def messages
    self
  end

  def create(body:, to:, from:)
    @message = {body: body, to: to, from: from}
    self
  end
  
end
