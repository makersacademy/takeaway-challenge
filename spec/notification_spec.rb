require 'notification'

describe Notification do

  # Set up mock for the Twilio SMS Client
  # SMS client class double
  let(:sms_client_class) { double(:sms_client_class, new: sms_client_inst) }

  # SMS client instance double
  let(:sms_client_inst) { double(:sms_client_inst, messages: messages_inst) }

  # Time now
  let(:time) { Time.now }

  # SMS client messages instance double
  let(:messages_inst) do
    messages_inst = double(:messages_inst)
    allow(messages_inst)
      .to receive(:create).with(any_args)
      .and_return("Thank you! Your order was placed and will be delivered before #{time}")
    messages_inst
  end

  # Notification with mocked client
  let(:mocked_notification) { Notification.new(sms_client_class) }

  it '#send responds with one argument' do
    expect(mocked_notification).to respond_to(:send).with(1).argument
  end
  it '#send sends a message with the passed delivery time' do
    expect(mocked_notification.send(time)).to eq "Thank you! Your order was placed and will be delivered before #{time}"
  end
end
