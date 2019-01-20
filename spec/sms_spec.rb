require 'sms'

describe Sms do

  it "sends a text message confirming delivery time" do
    expect(subject.send_sms).to eq nil 
  end
end
