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

  describe '#total' do
    it 'returns the total price of the order' do
      order.add(dish, 2, 3)
      order.add(dish, 5, 4)
      expect(order.total).to eq 26
    end
  end

  describe '#confirm' do
    specify{ expect{ subject.confirm }.to output.to_stdout }
  end

end
