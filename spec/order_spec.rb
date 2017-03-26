require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double(:dish) }
  let(:amount) { double(:amount) }
  let(:price) { double(:price) }


  it 'initializes with an empty array' do
    expect(order.basket).to be_empty
  end

  describe '#add' do
    it 'adds the last entry to the basket' do
      allow(price).to receive(:*)
      order.add(dish, price, amount)
      expect(order.basket.last.count).to eq 4
    end
  end

end
