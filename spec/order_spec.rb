require 'order'

describe 'order' do

  let(:order) { Order.new }
  let(:pizza) { double(:dish, name: "Pizza", price: BigDecimal(1.51, 4)) }
  let(:sushi) { double(:dish, name: "Sushi", price: BigDecimal(16, 4)) }
  context '#add' do
    it 'returns the price of the first item added' do
      expect(order.add(pizza)).to eq(BigDecimal(1.51, 4))
    end

    it 'returns the correct total when multiple items have been added' do
      order.add(pizza)
      expect(order.add(sushi)).to eq(BigDecimal(17.51, 4))
    end

    it 'returns the correct total when a large number of items have been added' do
      9.times{ order.add(sushi) }
      order.add(pizza)
      expect(order.add(sushi)).to eq(BigDecimal(161.51, 5))
    end
  end

  context '#total' do
    it 'returns the correct total when a large number of items have been added' do
      10.times{ order.add(sushi) }
      order.add(pizza)
      expect(order.total).to eq(BigDecimal(161.51, 5))
    end
  end

end