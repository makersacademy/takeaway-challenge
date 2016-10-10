require "text"

describe Text do
  subject(:text) { described_class.new(client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }

  it "returns a delivered text at a certain time" do
    args = {
      from: ENV['TWILIO_NUM'],
      to: ENV['MY_NUM'],
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("18:50"))
    expect(messages).to receive(:create).with(args)
    text.deliver
  end

end
