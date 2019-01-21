require 'message_sender'

describe MessageSender do
  let (:from) { ENV.fetch('TWILLIO_FROM_NUMBER') }
  let (:to) { ENV.fetch('TWILLIO_TO_NUMBER') }
  let(:body) { "Hello world"}
  it "sends messages to number passed to it" do
    stub_const("MessageSender::Client", FakeSMS)
    message = MessageSender.new
    message.send_message(from, to, body)
    expect(message.client.messages_array).to eq [from, to, body]
  end
end

class FakeSMS

  attr_accessor :messages_array
  def initialize(_account_sid, _auth_token)
    @messages_array = []
  end

  def messages
    self
  end

  def create(from: from, to: to, body: body)
    @messages_array = [from, to, body]
  end
end
