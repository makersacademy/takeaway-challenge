require 'takeaway'
require 'twilio-ruby'

describe Takeaway do

  let(:dummy_messages) { double :dummy_messages }
  let(:client) do
    double :client, messages: dummy_messages
  end

  let(:beijing_hanoi) { double :person, number: '441322721370', name: 'BeijingHanoi' }
  let(:nat) { double :person, number: '447921262696', name: 'Nat' }

  xit 'sends a message' do
    expect(dummy_messages).to receive :create
    subject.send_text(message: "Your order has been placed", from: beijing_hanoi, to: nat, via: client)
  end
end