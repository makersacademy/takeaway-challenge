require 'twilio_messager'

describe Messager do
  
  subject(:messager)   { described_class.new }
  
  it 'sends a confirmation sms to the client' do
    allow(messager).to receive(:send_sms).and_return('Thank You! Your order will be delivered')
    expect(messager.send_sms("Thank You! Your order will be delivered")).to eq 'Thank You! Your order will be delivered'
  end
  
end
