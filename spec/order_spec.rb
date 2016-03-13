require 'order'

describe Order do

  let(:dish) { double(:dish) } #, price: 4.50, name: :steak
  let(:menu) { double(:menu) }
    # menu = Menu.new

  subject(:order) { described_class.new }

  describe '#initialize' do

    it '1. initializes with an empty "selections" array' do
      expect(order.selections).to be_an(Array)
    end

  end

  describe '#select' do

    it '2. can add choices from menu to selections ' do
      food_hash = { beef: 11 }
      allow(menu).to receive(:contents).and_return(food_hash)

                    # fish: Dish.new('Monkfish Madras', 13),
                    # dahl: Dish.new('Mustard Dahl', 9),
                    # rice: Dish.new('Cardamom Rice', 6)  }
      allow(menu).to receive(:place_order).and_return(food_hash[:beef])
      order.choose(:beef)
      expect(order.selections.last).to eq(menu.contents(:beef))
    end

  end

  describe '#sum_total' do

    it '3. Returns an integer as total price of selections' do
      allow(menu).to receive(:contents).and_return(dish)
      allow(dish).to receive(:price).and_return(2)
      order.choose(dish)
      expect(order.sum_total).to eq 4
    end
  end
end
