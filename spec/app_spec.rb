require "app"

describe Message do
  let(:menu) { described_class.new }
  
  # it "should be able to send texts" do
  #   expect(subject).to respond_to(:send_sms)
  #   subject.send_sms(1)
  # end

  it 'sends a payment confirmation text message' do
    price = double :price
    msg = Message.new(price)
    expect(msg).to receive(:send_sms)
    msg.send_sms
  end


end
