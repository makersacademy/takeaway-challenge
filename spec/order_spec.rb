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
  subject(:order) { described_class.new(menu) }

  describe '#read_menu' do
    it 'can read the menu' do
      menu = double(:menu, name: "Dominos", dishes: { "Cheese & Tomato" => 6 })
      order = Order.new(menu)
      menu_output = "Dominos Menu\nCheese & Tomato                6.00\n"
      allow(menu).to receive(:to_s).and_return(menu_output)
      expect { puts order.read_menu }.to output(menu_output).to_stdout
    end
  end

  describe '#add' do
    it 'does not add to the basket if the dish is not on the menu' do
      expect(order.add("Vegi Volcano", 2)).to eq "Vegi Volcano is not on the menu"
    end

    context 'dish is on the menu' do
      it 'adds the dish and the quantity to the basket' do
        basket = { "Cheese & Tomato" => 2 }
        expect { order.add("Cheese & Tomato", 2) }.to change { order.basket }.to basket
      end

      it 'updates the quantity of the dish in the basket' do
        basket = { "Cheese & Tomato" => 2 }
        order.add("Cheese & Tomato", 1)
        expect { order.add("Cheese & Tomato", 1) }.to change { order.basket }.to basket
      end
    end
  end

  describe '#total' do
    it 'calculates the total for the order' do
      expect { order.add("Cheese & Tomato", 2) }.to change { order.total }.to 12
    end
  end
end
