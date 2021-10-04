require_relative "../lib/confirmation.rb"

RSpec.describe Confirmation do
  subject(:confirmation) { described_class.new(credentials, client: client) }
  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }
  let(:delivery_time) { (Time.now + 3600).strftime("%I:%M %p") }
  let(:credentials) do
    {
      account_sid: "AC123",
      auth_token: "456",
      to: "+44123456789",
      from: "+4407000000000",
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
    }
  end
  let(:message_details) do
    {
      to: credentials[:to],
      from: credentials[:from],
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
    }
  end

  describe "#text" do
    it "Sends text stating order was placed successfully & will be delivered 1hr from now" do
      expect(subject.text).to eq "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    end
  end

  describe "#create_message" do
    it "Sends text with order confirmation & delivery time" do
      p subject.create_message
      expect(messages).to have_received(:create).with(message_details)
    end
  end
end
