require "./lib/messager.rb"

describe Messager do

  it "verifies send_sms is a method of Messager" do
    is_expected.to respond_to(:send_sms).with(1).argument
  end

  it "sends a text message" do
    expect(subject).to receive(:send_sms).with("your order is complete")
    subject.send_sms("your order is complete")
  end

end
