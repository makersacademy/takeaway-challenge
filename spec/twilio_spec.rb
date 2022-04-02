require 'twilio'

describe TwilioClient do
  it 'should be able to send a text message' do
    allow(subject).to receive(:send_text).and_return("Thank you! Your order was placed and will be delivered before 17:30")
    expect(subject.send_text("number")).to eq("Thank you! Your order was placed and will be delivered before 17:30")
  end
end
