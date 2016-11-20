require 'sms_sender'

describe SMSSender do

  let (:sender) {described_class.new}

  it "should have a method send_sms with two arguments, message and the receiver" do
    expect(sender).to respond_to(:send_message).with(2).arguments
  end

end
