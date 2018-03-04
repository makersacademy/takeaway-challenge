require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double :menu, show_menu: "Margherita: £4.00" }
  let(:order) { double :order }
  let(:dishes) { {margherita: 2, capricciosa: 3} }


  context 'list of dishes on menu and their prices' do
    describe '#read_menu' do
      it 'shows the menu with prices' do
        expect(takeaway.read_menu).to eq("Margherita: £4.00")
      end
    end
  end

  context 'ordering available dishes' do
    describe '#place_order' do
      it 'places the order' do
        expect(order).to receive(:add).twice
        takeaway.place_order(dishes)
      end
    end
  end

end
