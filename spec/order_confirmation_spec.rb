require 'order_confirmation'
require 'spec_helper'

describe OrderConfirmation do


  let(:create) { double(:create) }
  let(:messages) { double(:messages, create: create) }
  let(:account) { double(:account, messages: messages) }
  # let(:client) { double(:client, account: account) }
  let(:twilio_client) { double(:Twilio, account: account) }
  let(:twilio_client_class) { double :Twilio, new: twilio_client }
  subject(:order_confirmation) { described_class.new(twilio_client_class)}

  it 'sends a payment confirmation text message' do
    expect(messages).to receive(:create)
    order_confirmation.send_sms("Thanks")
  end


end
