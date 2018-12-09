require 'send_sms'

describe SMS do

  it "sends a text with the delivery time" do
    @sms = SMS.new(Time.now)
    expect(@sms).to receive(:send_confirmation)
    @sms.send_confirmation(@time)
  end

end
