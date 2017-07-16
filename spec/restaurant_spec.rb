require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(EXAMPLE_MENU) }
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
end
