require 'order'
require 'menu'

describe Order do
  subject(:order) {described_class.new}
  let (:example_order) do
    { Pizza: 2,
      Pasta: 1 }
  end
  # let (:example_dish) { double example_dish: 'Pizza', quantity: 1}

  context 'basket' do

    it 'is empty to begin with' do
      expect(order.basket).to be_empty
    end

    it 'allows the customer add a dish from the menu' do
      order.add_to_basket(:Pizza, 2)
      order.add_to_basket(:Pasta, 1)
      expect(order.basket).to eq example_order
    end

    it 'informs customer that dish has been added' do
      expect(order.add_to_basket(:Pizza, 1)).to eq "1x Pizza has been added to your basket."
    end

    xit 'wont allow customer to add a dish not on the menu' do
      # order.add_to_basket('Burger', 1)
      expect{order.add_to_basket('Burger', 1)}.to raise_error "That item is not on the menu"
    end
    # This one isn't working. Also want it to be outside this method.

    xit 'calculates the total cost' do
      # Make a fake menu, add some items to the basket and calculate the values.
      expect(order.total).to eq 10
    end
  end
end
