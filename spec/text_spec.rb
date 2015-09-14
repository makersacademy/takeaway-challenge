require 'text'
require '../.env.rb'
require 'twilio-ruby'

describe Text do
  it { is_expected.to respond_to :time }


  it "should send a deliver text" do
    messages = double :messages, create: nil
    account = double :account, messages: messages
    client = double :client, account: account

    allow(Twilio::REST::Client).to receive(:new) { client }
    expect(messages).to receive(:send_text).with(body: "Thank you for your order. It will be delivered before 02:07", to: :phone_number, from: "441724411046")
    subject.send_text
  end
end
