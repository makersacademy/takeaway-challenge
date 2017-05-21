require 'sms_sender'

describe SmsSender do

  subject(:sms_sender) {double :sms_sender}

  it 'responds to #send' do
    expect(sms_sender).to respond_to(:send).with(1).argument
  end

end
