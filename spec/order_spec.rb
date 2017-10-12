require './lib/order.rb'

describe Order do

  let(:order_items) { [
    double(:order_item_1, name: 'Test Item 1', description: 'Test item 1 description', price: '10.95'),
    double(:order_item_2, name: 'Test Item 2', description: 'Test item 2 description', price: '5.99'),
    double(:order_item_3, name: 'Test Item 3', description: 'Test item 3 description', price: '2.50'),
    double(:order_item_4, name: 'Test Item 4', description: 'Test item 4 description', price: '12.00')]
  }

  subject(:order_empty) { described_class.new }

  context '#initialization' do
    it 'creates order' do
      expect(order_empty).to be_an_instance_of Order
    end

    it 'has an empty ItemList::List order_items' do
      expect(order_empty.order_items).to be_an_instance_of ItemList::List
    end

    it { is_expected.to respond_to(:order_items) }

    it { is_expected.to respond_to(:add_item) }

    it { is_expected.to respond_to(:remove_item) }

    it { is_expected.to respond_to(:view_order) }
  end

  context '#add_item' do

    it 'it adds entry to order_items' do
      expect { order_empty.add_item(order_items[0]) }.to change { order_empty.order_items.items }.to [order_items[0]]
    end

    it 'it returns success' do
      expect(order_empty.add_item(order_items[0])).to eq 'Success'
    end
  end

  context '#remove_dish' do
    it 'it removes entry from menu_items' do
      order_empty.add_item(order_items[0])
      expect { order_empty.remove_item(order_items[0]) }.to change { order_empty.order_items.items }.to []
    end

    it 'it returns success' do
      expect(order_empty.add_item(order_items[0])).to eq 'Success'
    end
  end

  context 'order full' do
    subject(:order_full) { described_class.new }

    before(:each) do
      order_items.each do |order_item|
        allow(order_item).to receive(:[]).and_return("#{order_item.name}", "#{order_item.price}")
        allow(order_item).to receive(:keys).and_return(%w(name description price))
      end

      [order_items[0], order_items[1], order_items[2], order_items[3]].each { |order_item| order_full.add_item(order_item) }
    end

    context '#total' do
      it 'it returns the total cost of order' do
        expect(order_full.total).to eq 31.44
      end
    end

    context '#view_order' do
      it 'it returns a formatted order summary' do
        expect(order_full.view_order).to eq "1. Test Item 1 10.95\n2. Test Item 2 5.99\n3. Test Item 3 2.50\n4. Test Item 4 12.00"
      end
    end
  end
end
