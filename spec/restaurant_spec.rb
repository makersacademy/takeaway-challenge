require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new(EXAMPLE_MENU, order) }
  let(:order) { double(:order) }
  EXAMPLE_MENU = [
     { category: 'pizzas', items: [{ name: 'margherita', price: 5 },
                                   { name: 'pepperoni', price: 7 },
                                   { name: 'hawaiian', price: 7 }] },
     { category: 'drinks', items: [{ name: 'coke', price: 2 },
                                   { name: 'lemonade', price: 2 }] }
   ]

  let(:pretty_menu) {
    "Pizzas:\n  Margherita (£5.00)\n  Pepperoni (£7.00)\n  Hawaiian (£7.00)\nDrinks:\n  Coke (£2.00)\n  Lemonade (£2.00)\n"
  }

  describe '#display_menu' do
    it 'displays the menu items' do
      expect { restaurant.display_menu }.to output(pretty_menu).to_stdout
    end
  end

  describe '#select_dish' do
    it 'raises an error if the dish does not exist' do
      expect{ restaurant.select_dish('curry', 1) }.to raise_error("This dish is not on the menu")
    end
    it 'tells the order to add the dishes to the order' do
      expect(order).to receive(:add_to_basket)
      restaurant.select_dish('margherita', 1)
    end
  end

  describe '#view_order' do
    it 'asks order object to view the order' do
      expect(order).to receive(:view_order)
      restaurant.view_order
    end
  end

end
