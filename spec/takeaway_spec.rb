require 'takeaway'
require 'menu'

describe Takeaway do
  let(:menu) { double :menu, dish_list: Menu::DISHES }
  let(:takeaway) { described_class.new(menu)}
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
        expect{ takeaway.order('biryani', 3) }.to change{ takeaway.current_order['biryani'] }.by +3
      end
  end

  describe '#total' do
    it 'shows the total of all orders placed' do
      allow(menu).to receive(:dishes) { Menu::DISHES }
      takeaway.order('biryani')
      order_quantity = takeaway.current_order['biryani']
      dish_price = takeaway.menu.dishes['biryani']
      expect(takeaway.total).to eq "Total: #{order_quantity * dish_price}"
    end
  end

  describe '#order_list' do
    it 'prints all current orders' do
      allow(menu).to receive(:dishes) { Menu::DISHES }
      takeaway.order('biryani')
      expect(takeaway.order_list).to include 'biryani'
    end
  end


end
