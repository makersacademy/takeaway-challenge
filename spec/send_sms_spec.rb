require 'send_sms'

describe Message do

  it 'should send a text to a valid uk number' do
    allow(subject).to receive(:send).with(123456789)
    time = Time.now + 3600
    expect(subject.send(123456789)).to eq("Thank you! Your order was placed and will be delivered before #{time.strftime("%F %T")}")
  end

end
