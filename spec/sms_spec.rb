require 'sms'
# Needs to recieve an order object to pass send text 

RSpec.describe SMS do
  let(:order){ double :order, send_text: "Your order will be delivered at 18:53" }
  sms = SMS.new
  

  it 'sends a text' do
    allow(subject).to receive(:send_text)
  end

  it 'sends a message to the customer' do
    expect(order.send_text).to eq "Your order will be delivered at 18:53" 
  end
end

