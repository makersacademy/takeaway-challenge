describe OrderVerifier do

  let(:selected_dishes) { [["a", 7.00, 1], ["b", 5.50, 2]] }
  let(:order) { double :order, selected_dishes: selected_dishes }
  let(:message_handler) { double :message_handler }
  before { allow(message_handler).to receive(:send_message).with(anything) }
  subject(:order_verifier) { described_class.new(message_handler) }

  describe '#process_order' do

    it 'places the order when corrrect' do
      allow(order).to receive(:total).and_return(18.00)
      expect(message_handler).to receive(:send_message)
      subject.process_order(order)
    end

    it 'raises an error when not correct' do
      allow(order).to receive(:total).and_return(20.00)
      expect { subject.process_order(order) }.to raise_error("Order total does not match")
    end

  end

end
