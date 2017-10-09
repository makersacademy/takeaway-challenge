require './lib/order.rb'

describe Order do

  let(:order_item_1) { double :order_item_1, name: 'Test Item 1', description: 'Test item 1 description', price: '10.95' }
  let(:order_item_2) { double :order_item_2, name: 'Test Item 2', description: 'Test item 2 description', price: '5.99' }
  let(:order_item_3) { double :order_item_3, name: 'Test Item 3', description: 'Test item 3 description', price: '2.50' }
  let(:order_item_4) { double :order_item_4, name: 'Test Item 4', description: 'Test item 4 description', price: '12.00' }

  subject(:order_empty) { described_class.new }

  context '#initialization' do
    it 'creates order' do
      expect(order_empty).to be_an_instance_of Order
    end

    it 'has an empty ObjectList order_items' do
      expect(order_empty.order_items).to be_an_instance_of ItemList
    end

    it { is_expected.to respond_to(:order_items) }
  end

  context '#add_item' do

    it 'it adds entry to order_items' do
      expect { order_empty.add_item(order_item_1) }.to change { order_empty.order_items.items }.to [order_item_1]
    end

    it 'it returns success' do
      expect(order_empty.add_item(order_item_1)).to eq 'Success'
    end
  end

  context '#remove_dish' do
    it 'it removes entry from menu_items' do
      order_empty.add_item(order_item_1)
      expect { order_empty.remove_item(order_item_1) }.to change { order_empty.order_items.items }.to []
    end

    it 'it returns success' do
      expect(order_empty.add_item(order_item_1)).to eq 'Success'
    end
  end

  context 'order full' do
    subject(:order_full) { described_class.new }

    before(:each) do
      order_full.add_item(order_item_1)
      order_full.add_item(order_item_2)
      order_full.add_item(order_item_3)
      order_full.add_item(order_item_4)
      allow(order_item_1).to receive(:keys).and_return(%w(name description price))
      allow(order_item_2).to receive(:keys).and_return(%w(name description price))
      allow(order_item_3).to receive(:keys).and_return(%w(name description price))
      allow(order_item_4).to receive(:keys).and_return(%w(name description price))
      allow(order_item_1).to receive(:map).and_return(['Test Item 1          ', 'Test item 1 description          ', '10.95          '])
      allow(order_item_2).to receive(:map).and_return(['Test Item 2          ', 'Test item 2 description          ', '5.99          '])
      allow(order_item_3).to receive(:map).and_return(['Test Item 3          ', 'Test item 3 description          ', '2.50          '])
      allow(order_item_4).to receive(:map).and_return(['Test Item 4          ', 'Test item 4 description          ', '12.00          '])
    end

    context '#total' do
      it 'it returns the total cost of order' do
        expect(order_full.total).to eq 31.44
      end
    end

    context '#view_order' do
      it 'it returns a formatted list string' do
        expect(order_full.view_order).to eq "1. Test Item 1          Test item 1 description          10.95          \n2. Test Item 2          Test item 2 description          5.99          \n3. Test Item 3          Test item 3 description          2.50          \n4. Test Item 4          Test item 4 description          12.00          "
      end
    end
  end
end
