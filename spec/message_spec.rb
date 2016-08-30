require 'message'
require 'twilio-ruby'

describe Message do

  subject (:message) {described_class.new}

  xit 'sends a confirmation sms when the order is paid for' do
    expect(message.send_confirmation).to eq "Thank you! Your order was placed and will be delivered before #{((Time.new.hour) + 1)}:#{Time.new.min}"
  end


end
