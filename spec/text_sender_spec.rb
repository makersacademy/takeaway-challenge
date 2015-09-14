require 'text_sender'
require 'twilio-ruby'
require_relative '../.env.rb'

describe Delivery do


  it "sends a message" do
  
    messages = double :messages, create: nil
    account = double :account, messages: messages
    client = double :client, account: account

    allow(Twilio::REST::Client).to receive(:new) { client }
    expect(messages).to receive(:create).with(body: "Thank you for your order. It will be delivered before 11:36", to: "447590425818", from: "441496877050")
    subject.text_customer

  end

end
