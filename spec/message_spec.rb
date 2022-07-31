require "message"

describe Message do
  
  it 'tells client will receive order confirmation' do
    expect { subject.send }.to output("Order confirmed. You'll receive a message with a delivery estimate.\n").to_stdout
  end

  it "sends message" do
    allow(subject).to receive(:send)
    expect(subject).to receive(:send)
    subject.send
  end

end
