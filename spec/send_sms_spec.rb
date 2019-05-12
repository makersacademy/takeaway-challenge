require 'send_sms'
require 'time'

describe Message do
  it 'texts the order time' do
    allow(subject).to receive(:order_time).and_return("14:30")
    expect(subject.text_message).to eq("Thank you! Your order was placed and will be delivered before 14:30")
  end

  let(:time) { double :time }

  it 'adds an hour to the order time' do
    subject = Message.new(time)
    allow(time).to receive(:hour).and_return(10)
    allow(time).to receive(:min).and_return(10)
    expect(subject.order_time).to eq("11:10")
  end
end
