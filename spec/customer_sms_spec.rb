require 'customer_sms'

Describe OrderConfirmation do
  
  it 'sends notification with estimated delivery time' do
    expect(subject).to receive(:send_sms)
    subject.send_sms(20.93)
  end
end