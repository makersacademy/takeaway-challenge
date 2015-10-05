require 'text_sender'
require 'twilio-ruby'
require_relative '../.env.rb'

describe Delivery do

  it "sends a message" do

    messages = double :messages, create: nil
    account = double :account, messages: messages
    client = double :client, account: account

    allow(Twilio::REST::Client).to receive(:new) { client }
    expect(messages).to receive(:create).with(body: "Thank you for your order. It will be delivered before #{(Time.new + 3600).strftime("%H:%M")}", to: ENV[:NUMBER], from: ENV[:TWILIO])
    subject.text_customer

  end

end
