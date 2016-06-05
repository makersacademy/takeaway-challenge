require 'message'

describe Message do

  subject(:text) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }

  let(:config) do
    {
      account_sid: "number",
      auth_token: "token",
      from: "+123",
      to: "+456",
      body: "Thank you! Your order will be delivered before "
    }
  end

  it "delivers an SMS with the estimated time" do
    args = {
      from: config[:from],
      to: config[:to],
      body: config[:body] + (Time.now+(60*60)).to_s
    }
    text.send_text
    expect(messages).to have_received(:create).with(args)
  end

end
