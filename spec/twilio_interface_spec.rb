require 'twilio_interface'

RSpec.describe TwilioInterface do

  it 'expects a test message to be sent' do
    test_token = 'ENV'
    test_sid = 'ENV'
    twilio_interface = TwilioInterface.new(test_sid, test_token)

    test_message = twilio_interface.client.messages.create(
      :body => 'All in the game, yo',
      :to   => '+ENV',
      :from => '+ENV')

    expect(test_message.body).to eq 'Sent from your Twilio trial account - All in the game, yo'
  end

  it 'LIVE: expects a test message to be sent with time' do
    test_token = 'ENV'
    test_sid = 'ENV'
    twilio_interface = TwilioInterface.new(test_sid, test_token)

    test_message = twilio_interface.client.messages.create(
      :body => 'All in the game, yo',
      :to   => '+ENV',
      :from => '+ENV')

    expect(test_message.body).to eq 'Sent from your Twilio trial account - All in the game, yo'
  end

  context 'when confirming order' do
    it 'LIVE: receives confirmation that order comes in an hour' do
      customer = double :customer

      test_sid = 'ENV'
      test_token = 'ENV'
      test_interface = TwilioInterface.new(test_sid, test_token)

      time = Time.new(2017, 9, 10, 21, 0, 0)
      allow(Time).to receive(:new).and_return(time)
      one_hour = (60 * 60)
      an_hour_from_now = Time.new + one_hour

      confirm_order_text = "Thank you - your order will arrive at #{an_hour_from_now}"
      allow(customer).to receive(:confirm_order).and_return(test_interface.new_message('+ENV', '+ENV', confirm_order_text).body)
      expect(customer.confirm_order).to eq "Sent from your Twilio trial account - Thank you - your order will arrive at 2017-09-10 22:00:00 +0100"
    end
  end

end
