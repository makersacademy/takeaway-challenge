require 'message'

describe Message do
  let(:message) { Message.new }
  it "should respond with Message sent" do
    expect(message.send_text).to eq "Message sent"
  end

  it "should create a useful text message with a delivery window an hour later" do
    time = Time.now+60*60
    delivery_time = "#{time.strftime('%H')}:#{time.strftime('%M')}"
    expect(message.create).to eq "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end
end
