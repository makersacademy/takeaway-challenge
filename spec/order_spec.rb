require 'order'

describe Order do
  subject(:my_order) { described_class.new }

  it 'can create an Order' do
    expect(my_order).to be_a_kind_of(Order)
  end

  it 'has a default empty hash to store the order' do
    expect(my_order.basket).to eq Hash.new(0)
  end

  describe '#add_dish' do
    it 'adds an available dish to order' do
      expect { my_order.add_dish('Pasta') }.to change { my_order.basket }.from(Hash.new(0)).to({ 'Pasta' => 12 })
    end

    it 'stores a dish in the order' do
      my_order.add_dish('Pizza')
      expect(my_order.basket).to include('Pizza')
    end
  end

  describe '#remove_dish' do
    it 'removed a dish from the order' do
      my_order.add_dish('Burger')
      expect { my_order.remove_dish('Burger') }.to change { my_order.basket['Burger'] }.from(13).to(0)
    end
  end
end
