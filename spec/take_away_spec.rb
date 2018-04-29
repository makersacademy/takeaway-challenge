require 'take_away'

describe TakeAway do

  let(:dish) { double :dish , name: 'Curry', price: 5}
  let(:dish2) { double :dish , name: 'Chips', price: 2 }
  let(:menu) { double :menu, list: [dish, dish2], pretty_print: "1) Curry - £5\n2) Chips - £2\n" }
  let(:take_away) { TakeAway.new('Los Pollos Hermanos', menu) }

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
      expect do
        take_away.display_menu
      end.to output("Los Pollos Hermanos\n==============================\n1) Curry - £5\n2) Chips - £2\n==============================\n").to_stdout
    end
  end

  describe '#basket_total' do
    it 'prints the total price of all items in the basket' do
      take_away.add_to_basket(1)
      take_away.add_to_basket(2)
      expect(take_away.basket_total).to eq('The current total of your order is £7')
    end
  end
end
