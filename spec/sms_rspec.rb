require 'sms'

describe "sms" do
  let(:order) { Order.new }
  let(:sms) { Sms.new }
  let(:message) { double :message }
  let(:client) { double :client }

  it "should send a text message" do
    allow(send_sms.client).to receive_message_chain(:messages, :create).and_return("test sms")
    expect(subject.send_sms(message)).to eq "test sms" 
  end
end
