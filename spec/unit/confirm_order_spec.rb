require 'confirm_order'

describe ConfirmOrder do
  let (:menu) { double('menu') }
  subject(:confirm_order) { described_class.new(menu, requested_order) }

  context '#order_checked?' do
    context 'when requested order is valid' do
      let(:requested_order) { {banana: 2, peach: 1} }

      it 'confirms ordered items are on the menu' do
        allow(menu).to receive(:menu_list).and_return(
          {
            banana: 1.99,
            strawberry: 2.99,
            peach: 3.99,
            coconut: 4.99
            }
          )

        expect(confirm_order.order_checked?).to eq true
      end
    end

    context 'when requested order is invalid' do
      let(:requested_order) { {pear: 2, peach: 1} }

      it 'confirms ordered items are not on the menu' do
        allow(menu).to receive(:menu_list).and_return(
          {
            banana: 1.99,
            strawberry: 2.99,
            peach: 3.99,
            coconut: 4.99
            }
          )
        expect(confirm_order.order_checked?).to eq false
      end
    end
  end
end
