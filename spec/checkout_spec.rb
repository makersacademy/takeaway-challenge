require "checkout"
require "takeaway"
describe Checkout do
  # let(:totalorder) { Checkout.new }
  let(:neworder) { Checkout.new }
  it { is_expected.to respond_to :payment }
  it { is_expected.to respond_to :total }
  it { is_expected.to respond_to :payment }
  describe "#payment" do
  end

  it "sends a payment confirmation text message" do
    expect(subject).to receive(:send_sms)
    subject.send_sms(20.93)
  end
end
