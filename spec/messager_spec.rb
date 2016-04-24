require 'messager'

describe Messager do
  let(:delivery_time) { "13:25" }
  let(:customer) {double :customer, name: "Sergio", phone: "+441234567890"}
  let(:message) {"Hi Sergio, thank you for your order of 3.14€."}
  let(:cm) {double :cm, customer: customer, delivery_time: delivery_time, body_msg: message }
  subject(:messager) { described_class.new(customer) }

  it "respond to customer" do
    expect(messager).to respond_to :content_manager
  end

  context('send text method') do
    before do
      allow(messager).to receive(:send_text)
    end
    it 'sends a payment confirmation text message' do
      expect(messager).to receive(:send_text).with("Thank you for your order: 3.14€")
      messager.send_text("Thank you for your order: 3.14€")
    end
  end
end