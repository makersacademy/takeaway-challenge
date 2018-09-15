require 'order'

describe Order do
  let(:order)     { described_class.new }
  let(:dish)      { double('dish') }
  let(:dish)      { double 'doughnut', price: 1.99 }
  let(:menu)      { double  }
  # let(:quantity)  { double(3) }

  describe 'a new order' do
    it 'starts with an empy basket' do
      expect(order.basket).to be_empty
    end

    it 'starts with a total of zero' do
      expect(order.total).to eq 0
    end
  end

  describe 'creating an order' do
    it 'adds a dish from the menu to an order' do
      order.add(dish, 3)
      expect(order.basket).to include(dish => 3)
      #expect(order.add(dish, 3)).to change { order.item_count }.by(3)
    end

    # it 'can view the basket' do
    #   order.add
    # end
  end
end
