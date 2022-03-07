require 'twilio'

describe TwilioClient do
  it "calling method" do
    allow(TwilioClient).to receive(:send_message).and_return "Thank you! Your order was placed and will be delivered before 18:52"
    expect(TwilioClient.send_message("phone_number")).to eq "Thank you! Your order was placed and will be delivered before 18:52"
  end

end
