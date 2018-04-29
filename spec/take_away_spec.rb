require 'take_away'

describe TakeAway do
  describe '#add_to_basket' do
    let(:dish) { double :dish , name: 'Curry', price: 5 }
    let(:dish2) { double :dish , name: 'Chips', price: 2 }
    let(:menu) { double :menu, list: [dish, dish2] }
    let(:take_away) { TakeAway.new(menu) }

    it 'adds input items to a new order' do
      take_away.add_to_basket(1)
      expect(take_away.basket.items).to include(dish)
    end
  end
end
