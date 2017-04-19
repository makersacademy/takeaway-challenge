require 'order'

describe Order do

  subject(:order) { described_class.new }

  before do
    order.select_dish(dish: "chips", quantity: 5, price: 1)
  end

  context 'when selecting dish' do
    it 'allows user to select dish returning total' do
      expect(order.total).to eq 5
    end

    it 'stores dish with quantity' do
      expect(order.basket).to eq({"chips" => 5})
    end
  end

  context 'when asked to empty basket' do
    before do
      order.clear_basket
    end
    it 'clears basket' do
      expect(order.basket).to be_empty
    end

    it 'clears total' do
      expect(order.total).to eq 0
    end
  end

  context 'when updating order' do
    before do
      order.select_dish(dish: "chips", quantity: 5, price: 1)
    end

    it 'updates basket' do
      expect(order.basket).to eq({"chips" => 10})
    end

    it 'updates total' do
      expect(order.total).to eq 10
    end
  end

end
