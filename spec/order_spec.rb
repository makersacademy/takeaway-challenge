require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:bill) { 20 }
  let(:twilio) { double :twilio}
  let(:takeaway) { double :takeaway}
  let(:items) { { pies: 5, chips: 3} }
  let(:confirm) {"Thank you! Your order was placed "\
                  "and will be delivered before "\
                 "#{(Time.now+ 60*60).strftime("%H:%M")}"
  }

  describe '#save' do
    it 'saves an order and returns it' do
      order.save = items
      expect(order.save).to eq items
    end
  end

  describe '#order_placed' do
    it 'sends text message' do
      allow(order).to receive(:send_text).and_return(confirm)
      expect(order.order_placed(twilio)).to eq (confirm)
    end
  end
end