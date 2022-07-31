require "./lib/messager.rb"

describe Messager do

  it "verifies send_sms is a method of Messager" do
    is_expected.to respond_to(:send_sms).with(1).argument
  end

  it "sends a text message" do
    expect(subject).to receive(:send_sms).with("your order is complete")
    subject.send_sms("your order is complete")
  end

  it "has  method not_phone_number" do
    is_expected.to respond_to(:phone_number).with(1).argument
  end

  it "will raise error if not  a phone number" do
    expect{ subject.phone_number("abc") }.to raise_error("invalid phone number")
  end

end
