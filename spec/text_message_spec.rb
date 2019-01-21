require 'text_message'

describe TextMessage do
  subject(:text_message) { described_class.new(config, client: client) }
  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  let(:config) do
    {
      account_sid: "1234",
      auth_token: "1234",
      from: "0123456",
      to: "0123456",
      body: "Thank you! Your order was placed and will be delivered before %s"
    }
  end

  it 'delivers a text message with the estimated time' do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(messages).to receive(:create).with(args)
    text_message.deliver
  end
end
