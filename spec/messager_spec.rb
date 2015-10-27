require 'messager'

describe Messager do

  let(:client) { double :client }
  let(:order) { 'Thank you for your order' }
  subject(:messager) { described_class.new }

  it "sends a confirmation text" do
    twilio_message_body = {
      from: ENV['SMS_FROM'],
      to: ENV['SMS_TO'],
      body: order
    }

    expect(Twilio::REST::Client).to receive(:new).
      with(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']).and_return(client)
    allow(client).to receive_message_chain(:messages, :create).
      with(twilio_message_body)
    allow(messager).to receive(:compose_message).with(order).and_return(order)
    messager.send_text(order)
  end
  
  it 'composes a message' do
    msg = "Your order has been confirmed! \
    Expect your yummie food by #{messager.delivery_time} \
    \n#{order}"

    expect(messager.compose_message order).to eq msg
  end

  it 'retuns a delivery time 1 hour from now' do
    @time_now = Time.parse("Oct 25 20015 10:00AM")
    allow(Time).to receive(:now).and_return(@time_now)
    expect(messager.delivery_time).to eq ('11:00')
  end
end
