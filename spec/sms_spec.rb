describe Sms do

  subject(:sms) { described_class.new }

  it 'responds to send_message' do
    expect(subject).to respond_to(:send_message)
  end

  it 'sends a confirmation text message' do
    text_message = sms.send_message
    delivery_time = Time.now + 3600
    expect(text_message.body).to include("Thank you! Your order will be delivered by #{delivery_time}")
  end
end
