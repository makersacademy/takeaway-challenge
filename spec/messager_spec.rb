require "./lib/messager.rb"

describe Messager do
  
  it "sends a text message" do
    expect(subject).to receive(:send_sms)
    subject.send_sms("your order is complete")
  end

end
