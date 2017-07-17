require 'restaurant'
require 'text_message'

describe Restaurant do

  subject(:restaurant) { described_class.new(EXAMPLE_MENU, order) }
  let(:order) { double(:order) }
  let(:correct_amount) { 10 }
  let(:incorrect_amount) { 5 }
  let(:not_on_menu) { 'curry' }
  EXAMPLE_MENU =
    { categories: ['pizzas', 'drinks'],
      items: [
       { name: 'margherita', price: 5, category: 'pizzas' },
       { name: 'pepperoni', price: 7, category: 'pizzas' },
       { name: 'hawaiian', price: 7, category: 'pizzas' },
       { name: 'coke', price: 2, category: 'drinks' },
       { name: 'lemonade', price: 2, category: 'drinks' }]
    }

  let(:pretty_menu) {
    "Pizzas:\n  Margherita (£5.00)\n  Pepperoni (£7.00)\n  Hawaiian (£7.00)\nDrinks:\n  Coke (£2.00)\n  Lemonade (£2.00)\n"
  }

  describe '#display_menu' do
    it 'displays the menu items' do
      expect { restaurant.display_menu }.to output(pretty_menu).to_stdout
    end
  end

  describe '#select_dish' do
    it 'tells the order to add the dishes to the order' do
      expect(order).to receive(:add_to_basket)
      restaurant.select_dish(EXAMPLE_MENU[:items].first[:name], 1)
    end
    it 'raises an error if the dish does not exist' do
      expect{ restaurant.select_dish(not_on_menu, 1) }.to raise_error("This dish is not on the menu")
    end
  end

  describe '#view_order' do
    it 'asks order object to view the order' do
      expect(order).to receive(:view_order)
      restaurant.view_order
    end
  end

  describe '#place_order' do
    it 'raises an error if the price entered is incorrect' do
      allow(order).to receive(:total_cost) { correct_amount }
      expect{ restaurant.place_order(incorrect_amount) }.to raise_error("Incorrect order total")
    end

    it 'raises an error if nothing is on the order' do
      allow(order).to receive(:total_cost) { 0 }
      expect{ restaurant.place_order(incorrect_amount) }.to raise_error("Nothing ordered")
    end

    it 'instructs Order class to send a confirmation SMS' do
      allow(order).to receive(:total_cost) { correct_amount }
      expect(order).to receive(:send_confirmation)
      restaurant.place_order(correct_amount)
    end
  end

end
