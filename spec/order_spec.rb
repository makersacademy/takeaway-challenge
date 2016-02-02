require 'order'

describe Order do
  subject(:order) { Order.new }

  it 'is empty by default' do
    expect(order).to be_empty
  end

  describe '#add' do
    before do
      order.add('Chips')
    end

    it 'adds one item by default' do
      expect(order.quantity_of('Chips')).to eq 1
    end

    it 'includes the item' do
      expect(order).to include 'Chips'
    end

    it 'can accept a quantity' do
      order.add('Fish', 2)
      expect(order.quantity_of('Fish')).to eq 2
    end

    it 'increases the quantity for ordered dishes' do
      order.add('Chips', 3)
      expect(order.quantity_of('Chips')).to eq 4
    end
  end

  describe '#quantity_of' do
    it 'returns 0 for unordered dishes' do
      expect(order.quantity_of('Saveloy')).to eq 0
    end
  end

  it 'is enumerable' do
    items = {'Fish' => 2, 'Chips' => 3 }
    items.each { |name, quantity| order.add name, quantity }

    order.each do |name, quantity|
      expect(items).to include name => quantity
    end
  end
end
