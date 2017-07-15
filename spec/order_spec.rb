require 'order'

describe Order do
  let(:menu) {
    double(
      :menu,
      name: "Dominos",
      dishes:
      {
        "Cheese & Tomato" => 6,
        "Mighty Meaty" => 9,
        "Pepperoni Passion" => 8,
        "Tandoori Hot" => 9,
        "Vegi Sizzler" => 8
      }
    )
  }
  subject(:order) { described_class.new(menu)}

  describe '#read_menu' do
    it 'can read the menu' do
      menu = double(:menu, name: "Dominos", dishes: { "Cheese & Tomato" => 6 })
      order = Order.new(menu)
      menu_output = "Dominos Menu\nCheese & Tomato                6.00\n"
      allow(menu).to receive(:to_s).and_return(menu_output)
      expect { puts order.read_menu }.to output(menu_output).to_stdout
    end
  end

  describe '#order' do
    it 'can add to basket a specific quantity of a dish' do
      basket = { "Cheese & Tomato" => 2 }
      expect { order.add("Cheese & Tomato", 2) }.to change { order.basket }.to basket
    end

    context 'invalid data while adding to order' do
      it 'does not add an item to basket if it not in the menu' do
        message = "Vegi Volcano cannot be added to the basket as it is not on the menu\n"
        expect { order.add("Vegi Volcano", 2) }.to output(message).to_stdout
      end
    end

  end
end
