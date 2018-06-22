require './lib/order.rb'

describe Order do
  let(:order) { Order.new }
  let(:item1) { { name: 'test dish 1', price: '£1.01', veggie: nil } }
  let(:item2) { { name: 'test dish 2', price: '£2.02', veggie: nil } }
  let(:menu) { double(:menu) }

  describe '#list' do
    it 'should list the items in the order' do
      order.instance_variable_set(:@items, [item1, item2])
      expect(order).to receive(:prettify).with(item1)
      expect(order).to receive(:prettify).with(item2)
      order.list
    end
  end

  describe '#prettify' do
    it 'should output an item and its price' do
      expect(STDOUT).to receive(:print).with(/#{item1[0]}\s*/)
      expect(STDOUT).to receive(:puts).with(/\s*#{item1[1]}/)
      order.prettify(item1)
    end
  end

  describe '#add_item' do
    it 'should select an item from the menu to the order' do
      order.instance_variable_set(:@current_menu, menu)
      expect(menu).to receive(:select).with(4)
      order.add_item(4)
    end

    it 'should add selected item to the current order' do
      order.instance_variable_set(:@current_menu, menu)
      allow(menu).to receive(:select) { item1 }
      order.add_item(4)
      expect(order.items).to include item1
    end
  end

  describe '#select_menu' do
    it 'should set the current menu to the given menu' do
      expect(Menu).to receive(:new).with('./docs/menu.csv')
      order.select_menu('./docs/menu.csv')
    end
  end

  describe '#print_total' do
    it 'should return the total value of the current order' do
      order.instance_variable_set(:@items, [item1, item2])
      expect(order.print_total).to eq '£3.03'
    end
  end
end
