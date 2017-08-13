require "app"

describe Message do
  let(:menu) { described_class.new }

  it "should respond to account_sid" do
    price = double :price
    msg = Message.new(price)
    expect(msg).to respond_to(:account_sid)
  end

  it "should respond to auth_token" do
    price = double :price
    msg = Message.new(price)
    expect(msg).to respond_to(:auth_token)
  end

  it 'sends a payment confirmation text message' do
    price = double :price
    msg = Message.new(price)
    expect(msg).to receive(:send_sms)
    msg.send_sms
  end

end
