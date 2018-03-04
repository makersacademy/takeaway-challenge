require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double :menu, show_menu: "Margherita: £4.00" }
  let(:order) { double :order, total: 37 }
  let(:dishes) { {margherita: 2, capricciosa: 3} }


  context 'list of dishes on menu and their prices' do
    describe '#read_menu' do
      it 'shows the menu with prices' do
        expect(takeaway.read_menu).to eq("Margherita: £4.00")
      end
    end
  end

  context 'ordering available dishes and returning total cost of order' do
    describe '#place_order' do
      it 'places the order' do
        expect(order).to receive(:add).twice
        takeaway.place_order(dishes)
      end

      it 'returns total cost of order' do
        allow(order).to receive(:add)
        expect(takeaway.place_order(dishes)).to eq(37)
      end
    end
  end

  context 'checking the total amount' do
    describe '#finalise_order' do
      it 'raises an error when total amount and price do not match' do
        allow(takeaway).to receive(:confirm_order).with(1).and_return('The total amount is not correct')
      end
    end
  end


end
