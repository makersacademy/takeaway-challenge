require 'order'

describe Order do
  let(:order) { Order.new }

  describe '#initialize' do

    it 'is initialized with an empty basket' do
    expect(order.basket).to eq([])
    end

  end

  describe '#add' do
    it 'will add the correct dish to the basket' do
    order.add(0)
    expect(order.basket).to include({ "1. Vegetable Ramen" => 5 })
    end
  end

end