require 'order'
require 'dishes'

describe Order do
  subject(:order) {described_class.new(menu)}
  let (:menu) { {"Pizza" => 7.99, "Pasta" => 5.50, "1L Coke" => 1.40} }
  let (:example_order) do
    { Pizza: 2,
      Pasta: 1 }
  end

  it 'is initialized with the menu' do
    expect(order.menu).to eq menu
  end

  context 'basket' do

    it 'is empty to begin with' do
      expect(order.basket).to be_empty
    end

    it 'allows the customer add a dish' do
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
  
    it 'calculates the total cost' do
      order.add_to_basket('Pizza', 2)
      expect(order.basket_subtotal).to eq 15.98
    end
    #This test it not passing for the right reasons. The code is incorrect.
  end
end
