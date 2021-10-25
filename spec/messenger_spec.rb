require 'messenger'

describe Messenger do

  it 'creates checkout message confirming the delivery time'do
    delivery_time = (Time.now.hour + 1).to_s + ":" + Time.now.min.to_s
    expect(subject.checkout).to eq("Thank you! Your order was placed and will be delivered before #{delivery_time}")
  end
  it 'receives text message' do
    # expect(subject.send_sms).to receive(:send_sms)
  end
end