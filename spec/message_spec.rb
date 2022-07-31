require 'message'

describe Message do
  let(:sms) { double :sms }
  let(:message) { described_class.new(sms) }

  it 'correctly formats the message to send' do
    delivery_time = (Time.now + (60 * 60)).strftime("%k:%M")
    expect(message.format_message(delivery_time)).to eq("Thank you! Your order was placed and will be delivered before #{delivery_time}")
  end
end
