class FakeSender
  Message = Struct.new(:from, :to, :body)

  attr_accessor :messages
  attr_reader :_account_sid, :_auth_token

  _account_sid, _auth_token = ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]

  def initialize(_as = _account_sid, _at = _auth_token)
    @messages = []
  end

  def messages
    self
  end
  
  def create(from:, to:, body:)
    @messages << Message.new(from: from, to: to, body: body)
  end
end
