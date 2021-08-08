require "./lib/order.rb"

describe Order do

  let(:working_messager) { double :messager, send_sms: true }
  let(:faulty_messager) { double :messager, send_sms: false }

  t = Time.now.to_i + 3600
  time_then = "Thank you! Your order was placed and will be delivered before " << Time.at(t).strftime('%H:%M')

  it "expects the order to be empty" do
    expect(subject.items).to be_empty
  end

  it { is_expected.to respond_to(:checkout).with(0).argument }

  it "send message Thank you! Your order was placed and will be delivered within one hour" do 
    subject = described_class.new(working_messager)
    expect(subject.checkout).to eq(time_then)
  end

  it "raise error if messager is faulty" do 
    subject = described_class.new(faulty_messager)
    expect{ subject.checkout }.to raise_error("failed to send sms to customer")
  end


end
