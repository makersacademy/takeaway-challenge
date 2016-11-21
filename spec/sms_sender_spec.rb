require 'sms_sender'

describe SMSSender do

  subject (:sender) {described_class.new}

  it "should have a method send_sms with two arguments, message and the receiver" do
    expect(sender).to respond_to(:send_message).with(1).argument
  end

end
