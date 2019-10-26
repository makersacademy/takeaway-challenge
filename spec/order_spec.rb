require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new }

  describe '#select' do
    let(:margarita) { "margarita" }
    let(:pepperoni) { "pepperoni" }
    before(:each) do
      order.select(margarita)
    end

    it 'should have 1 margarita pizza in the basket' do
      expect(order.basket).to eq([{ dish: margarita, quantity: 1 }])
    end

    it 'should have a total of £9' do
      expect(order.total).to eq(9)
    end

    it 'should increase quantity if item already in basket' do
      order.select(margarita)
      expect(order.basket.first[:quantity]).to eq(2)
    end

    it 'should allow you to add more than 1 of the chosen dish' do
      order.select(pepperoni, 2)
      expect(order.basket).to include({ dish: pepperoni, quantity: 2 })
    end
  end
end
