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
  let(:messenger) { double (:messenger) }
  subject(:order) { described_class.new(menu, messenger) }

  describe 'initialization' do
    it 'has an empty basket' do
      expect(order.basket).to be_empty
    end

    it 'has an order total of zero' do
      expect(order.total).to be_zero
    end

    it 'has not been placed' do
      expect(order).not_to be_placed
    end
  end

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

    it 'does not add to the basket if the order has already been placed' do
      allow(messenger).to receive_message_chain(:new, :send_message).and_return("Success")
      order.add("Cheese & Tomato", 2)
      order.checkout(12)
      expect(order.add("Vegi Sizzler", 1)).to eq "Cannot add, order already placed"
    end

    it 'does not add to the basket if the dish is not on the menu' do
      expect(order.add("Vegi Volcano", 2)).to eq "Cannot add, Vegi Volcano is not on the menu"
    end

    context 'dish added successfully to the basket' do
      it 'adds the dish and the quantity to the basket' do
        basket = { "Cheese & Tomato" => 2 }
        expect { order.add("Cheese & Tomato", 2) }.to change { order.basket }.to basket
      end

      it 'updates the quantity of the dish in the basket' do
        basket = { "Cheese & Tomato" => 2 }
        order.add("Cheese & Tomato", 1)
        expect { order.add("Cheese & Tomato", 1) }.to change { order.basket }.to basket
      end

      it 'updates the total for the order' do
        expect { order.add("Cheese & Tomato", 2) }.to change { order.total }.to 12
      end
    end
  end

  describe '#checkout' do

    it 'does not checkout if the basket is empty' do
      expect(order.checkout(0)).to eq "Cannot checkout, basket is empty"
    end

    context 'basket is not empty' do
      before do
        order.add("Cheese & Tomato", 2)
        allow(messenger).to receive_message_chain(:new, :send_message).and_return("Success")
      end

      it 'does not checkout if the amount is incorrect' do
        expect(order.checkout(10)).to eq "Incorrect amount"
      end

      it 'places the order if the amount is correct' do
        order.checkout(12)
        expect(order).to be_placed
      end

      it 'sends a confirmation text' do
        expect(order.checkout(12)).to eq "Success"
      end

      it 'does not checkout again if the order has already been placed' do
        order.checkout(12)
        expect(order.checkout(12)).to eq "Cannot checkout, order already placed"
      end
    end
  end
end
