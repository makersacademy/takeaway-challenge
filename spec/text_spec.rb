require 'rubygems'
require 'twilio-ruby'

describe Text do

  let(:customer) { double :customer, name: 'Jongmin',
    phone_number: '+44 7497 811148'}

  it 'has "send_text_message" method with 1 argument' do
    expect(Text).to respond_to(:send_text_message).with(2).argument
  end

  it 'sends text messages' do
    client = double(:client)
    allow(client).to receive_message_chain(:messages, :create)
    expect(Twilio::REST::Client).to receive(:new).and_return(client)
    Text.send_text_message(customer.name, customer.phone_number)
  end

end
