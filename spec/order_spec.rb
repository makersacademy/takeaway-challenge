require 'order'

describe Order do
  let(:menu) { double :menu, list: { carbonara: 4.80, amatriciana: 4.40 } }
  let(:restaurant) { double :restaurant, menu: menu }
  let(:order) { described_class.new restaurant }

  before do
    allow(order).to receive(:print)
    allow($stdout).to receive(:puts)
  end

  context 'when created' do
    it 'has to be empty when created' do
      expect(order.new_order).to be_empty
    end

    it 'refers to a restaurant' do
      expect(order.restaurant).to eq restaurant
    end

    it 'has an open status when created' do
      expect(order.status).to eq 'open'
    end
  end

  context 'after been created' do
    it 'can add items from the menu' do
      order.add_item :carbonara
      expect(order.new_order).to eq(carbonara: [1, 4.80])
    end

    it 'can add multiple items from the menu' do
      order.add_item :carbonara, 5
      expect(order.new_order).to eq(carbonara: [5, 24.00])
    end

    it 'can remove one item from the order' do
      order.add_item :carbonara
      order.remove_item :carbonara
      expect(order.new_order).to be_empty
    end

    it 'can remove multiple items from the order' do
      order.add_item :carbonara, 5
      order.remove_item :carbonara, 3
      expect(order.new_order).to eq(carbonara: [2, 9.60])
    end

    it 'can delete the item if there\'s no more in the order' do
      order.add_item :carbonara, 5
      order.remove_item :carbonara, 5
      expect(order.new_order).to be_empty
    end

    it 'raise an error if the added item is not in the menu' do
      expect { order.add_item :scaloppine }.to raise_error
    end

    it 'raise an error if the removed item is not in the order' do
      expect { order.remove_item :carbonara }.to raise_error
    end

    it 'can check the total so far' do
      order.add_item :carbonara
      order.add_item :amatriciana
      expect(order.total).to eq 9.20
    end

    it 'can be closed' do
      order.add_item :carbonara
      order.close 4.80
      expect { order.add_item :carbonara }.to raise_error
    end

    it 'cannot be closed twice' do
      order.add_item :carbonara
      order.close 4.80
      expect { order.close }.to raise_error
    end

    it 'raise error if the expected total is not equal to the total' do
      order.add_item :carbonara
      expect { order.close 3.0 }.to raise_error
    end

    it 'cannot be placed if empty' do
      expect { order.send }.to raise_error
    end
  end

  context 'after been closed' do
    it 'can be placed' do
      order.add_item :carbonara
      order.close 4.80
      allow(restaurant).to receive(:get)
      order.send_order :telephone
    end

    it 'cannot be placed if open' do
      expect { order.send_order :telephone }.to raise_error
    end
  end
end
