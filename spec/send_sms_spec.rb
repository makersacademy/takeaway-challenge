class FakeSMS
  Message = Struct.new(:from, :to, :body)

  cattr_accessor :messages
  self.messages = []

  def initialize(_account_sid, _auth_token)
  end

  def messages
    self
  end

  def create(from:, to:, body:)
    self.class.messages << Message.new(from: from, to: to, body: body)
  end
end

RSpec.configure. do |config|
  config.before(:each) do
    stub_const("Twilio::REST::Client", FakeSMS)
  end
end
