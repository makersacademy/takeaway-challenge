require 'order'

describe Order do
  subject(:order) { described_class.new }

  it { is_expected.to respond_to :basket }

  describe '#basket' do
    it 'starts as an empty basket' do
      expect(order.basket).to be_empty
    end
  end

  describe '#add_to_basket' do
    it 'adds specified input to basket' do
      order.add_to_basket('Cleanout curry', 2)
      my_basket = [{ item: 'Cleanout curry', amount: 2, price: 3.98 }]
      expect(order.basket).to eq my_basket
    end

    it 'groups multiple orders of the same item together' do
      order.add_to_basket('Cleanout curry', 2)
      order.add_to_basket('Cleanout curry', 1)
      my_basket = [{ item: 'Cleanout curry', amount: 3, price: 5.97 }]
      expect(order.basket).to eq my_basket
    end
  end
end
