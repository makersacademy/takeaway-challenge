describe SendSms do

  it 'allows users to send a message' do
    expect(subject).to respond_to(:send).with(1).argument
  end
end
