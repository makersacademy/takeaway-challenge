require 'text'
require 'twilio-ruby'

describe Text do

  it "initializes with Twilio 'from' number" do
    expect(subject.from).to eq(Numbers::TWILIO_NUMBER)
  end

  it "initializes with Twilio 'to' number" do
    expect(subject.to).to eq(Numbers::MY_NUMBER)
  end

  it "confirms order with a text message" do
    expect(subject).to respond_to(:confirm_order)
  end 

  # need a better test for confirming the order

end
