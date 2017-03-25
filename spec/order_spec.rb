require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double(:dish) }
  let(:amount) { double(:amount) }


  it 'initializes with an empty array' do
    expect(order.basket).to be_empty
  end

  describe '#add' do
    it 'adds the last entry to the basket' do
      order.add(dish, amount)
      expect(order.basket.last).to eq ({dish: dish, amount: amount})
    end
  end

end
