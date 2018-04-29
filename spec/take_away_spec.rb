require 'take_away'

describe TakeAway do

  let(:dish) { double :dish , name: 'Curry', price: 5 }
  let(:dish2) { double :dish , name: 'Chips', price: 2 }
  let(:menu) { double :menu, list: [dish, dish2], pretty_print: "1) Curry - £5\n2) Chips - £2\n" }
  let(:take_away) { TakeAway.new(menu) }

  describe '#add_to_basket' do

    it 'adds input item to a new order' do
      take_away.add_to_basket(1)
      expect(take_away.basket.items).to include(dish)
    end

    it 'allows multiple inputs of the same item' do
      take_away.add_to_basket(1, 2)
      expect(take_away.basket.items).to include(dish, dish)
    end
  end

  describe '#display_menu' do
    it 'prints a list of menu options and prices' do
      expect { take_away.display_menu }.to output("1) Curry - £5\n2) Chips - £2\n").to_stdout
    end
  end
end
