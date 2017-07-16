require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu, messager) }
  let(:menu) { double :menu }
  let(:messager) { double :messager }

  let(:valid_order) { double :valid_order }
  let(:order_cost) { 15 }
  let(:wrong_amount_tendered) { 12 }

  describe '#take_order' do
    it 'should raise an error if the total given does not equal the cost of the order' do
      allow(valid_order).to receive(:calculate_cost) { order_cost }
      expect { restaurant.take_order(valid_order, wrong_amount_tendered) }.to raise_exception("EXACT CHANGE PLEASE. Please provide exactly £#{order_cost}")
    end

    context 'valid order placed' do
      before do
        allow(valid_order).to receive(:calculate_cost) { order_cost }
      end

      it 'should add the amount taken to the cashier' do
        allow(messager).to receive(:send_confirmation_msg)
        expect { restaurant.take_order(valid_order, order_cost) }.to change { restaurant.cashier }.by order_cost
      end

      it 'should call for a confirmation message to be sent' do
        expect(messager).to receive(:send_confirmation_msg)
        restaurant.take_order(valid_order, order_cost)
      end
    end

  end

end
