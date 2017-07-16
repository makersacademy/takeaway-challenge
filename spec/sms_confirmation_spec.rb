require 'sms_confirmation'

describe 'SmsConfirmation' do
  
  it 'sends a delivery confirmation text message' do
    expect(subject).to receive(:send_text).with("Thank you! Your order was placed and will be delivered before #{Time.now + 3600}")
    subject.send_text("Thank you! Your order was placed and will be delivered before #{Time.now + 3600}")
  end

end
