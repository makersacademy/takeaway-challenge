require 'confirm_order'

describe ConfirmOrder do
  let (:menu) { double('menu') }
  subject(:confirm_order) { described_class.new(menu, requested_order) }

  before do
    allow(menu).to receive(:menu_list).and_return(
      {
        banana: 1.99,
        strawberry: 2.99,
        peach: 3.99,
        coconut: 4.99
        }
      )
  end

  context '#order_checked?' do
    context 'when requested order is valid' do
      let(:requested_order) { {banana: 2, peach: 1} }

      it 'confirms ordered items are on the menu' do
        expect(confirm_order.order_valid?).to eq true
      end

      it 'totals the order' do
        expect(confirm_order.calculate_total).to eq 7.97
      end
    end

    context 'when requested order is invalid' do
      let(:requested_order) { {pear: 2, peach: 1} }

      it 'raises an error when order is invalid' do
        error = 'Order not valid'
        expect{ confirm_order.raise_error_for_invalid_order }.to raise_error(error)
      end

      it 'confirms ordered items are not on the menu' do
        expect(confirm_order.order_valid?).to eq false
      end
    end

  end
end
