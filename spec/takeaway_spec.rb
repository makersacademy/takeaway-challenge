require 'takeaway'
require 'menu'

describe Takeaway do
  let(:menu) { double :menu, dish_list: Menu::DISHES }
  let(:takeaway) { described_class.new(menu) }
  let(:messenger) { double :messenger }
  describe 'initialization' do

    it 'has a menu' do
      expect(takeaway.menu).to eq menu
    end

    it 'has a place to store orders' do
      expect(takeaway.current_order).to be_empty
    end
  end

  describe '#order' do
    it 'can select a dish from menu' do
      allow(menu).to receive(:dishes) { Menu::DISHES }
      takeaway.order('biryani')
      expect(takeaway.current_order).to include 'biryani'
    end

    it 'can specify quantity of order' do
      allow(menu).to receive(:dishes) { Menu::DISHES }
      expect { takeaway.order('biryani', 3) }.to change { takeaway.current_order['biryani'] }.by +3
    end

    it 'raises error when dish is not on the menu' do
      allow(menu).to receive(:dishes) { Menu::DISHES }
      expect { takeaway.order('pizza') }.to raise_error 'we do not have that dish'
    end
  end

  describe '#show_total' do
    it 'shows the total of all orders placed' do
      allow(menu).to receive(:dishes) { Menu::DISHES }
      takeaway.order('biryani')
      order_quantity = takeaway.current_order['biryani']
      dish_price = takeaway.menu.dishes['biryani']
      expect(takeaway.show_total).to eq "Total: £#{order_quantity * dish_price}"
    end
  end

  describe '#order_list' do
    it 'prints all current orders' do
      allow(menu).to receive(:dishes) { Menu::DISHES }
      takeaway.order('biryani')
      expect(takeaway.order_list).to include 'biryani'
    end
  end

  describe '#complete_order' do
    context 'amount given does not equal to total' do
      it 'raises error' do
        allow(menu).to receive(:dishes) { Menu::DISHES }
        takeaway.order('biryani')
        expect { takeaway.complete_order(14.50) }.to raise_error 'please pay the correct amount'
      end
    end
  end
end
