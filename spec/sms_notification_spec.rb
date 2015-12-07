describe SmsNotification do
  subject(:sms) {described_class.new}
  it 'responds to order method' do
    expect(sms).to respond_to(:order)
  end
end
