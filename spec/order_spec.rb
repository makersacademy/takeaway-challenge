require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double :dish }

  it 'initializes with an empty basket' do
    expect(order.basket).to eq []
  end

  describe '#add_to_basket' do
    it 'adds a dish to the basket' do
      order.add_to_basket(dish)
      expect(order.basket).to eq [dish]
    end
  end

end
