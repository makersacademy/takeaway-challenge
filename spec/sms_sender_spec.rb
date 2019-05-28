require 'sms_sender'
require 'dotenv/load'

describe SmsSender do
  it 'can respond to confirm order' do
    my_sms_sender = SmsSender.new

    expect(my_sms_sender).to respond_to(:confirm_order)
  end

  it 'tells the client to create a message' do
    messages_double = double(create: "message sent")
    sms_client_double = double('sms_client_double')
    allow(sms_client_double).to receive(:messages).and_return(messages_double)
    sms_client_class_double = double('sms_client_class_double', new: sms_client_double)
    my_sms_sender = SmsSender.new(sms_client_class_double)

    expect(messages_double).to receive(:create)

    my_sms_sender.confirm_order
  end
end
