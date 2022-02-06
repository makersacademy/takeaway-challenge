require_relative '../lib/messaging'

describe Messaging do

  let(:messaging_type) { double(:messaging_type, :send => nil) }

  let(:from) { "2" }
  let(:to) { "1" }
  let(:message) { "Thank you! Your order was placed and will be delivered before 18:52" }

  subject(:messaging) { described_class.new(messaging_type, from, to, message) }

  it "has a to telephone number" do
    expect(messaging.to).to eq "1"
  end

  it "has from telephone number" do
    expect(messaging.from).to eq "2"
  end

  it "has a message" do
    expect(messaging.message).to eq message
  end

  it "updates the message" do
    message = "new message"
    messaging.message = message
    expect(messaging.message).to eq message
  end

  it "sends an SMS message" do
    expect { messaging.send }.not_to raise_error
  end

end
