.selectrequire 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new }

  describe '#select' do
    let(:margarita) { double "margarita" }
    before(:each) do
      order.select(margarita)
    end

    it 'should have 1 margarita pizza in the basket' do
      expect(order.basket).to eq([{dish: margarita, quantity: 1}])
    end

    it 'should have a total of £9' do
      expect(order.total).to eq(9)
    end

    xit 'should increase quantity if item already in basket' do
      order.select(margarita)
      expect(order.basket.first[:quantity]).to eq(2)
    end

    # xit 'should keep a list of the items ordered and their quantity' do
    #   order.select("margarita")
    #   expect(order.basket).to include("margarita")
    # end
  end
end
