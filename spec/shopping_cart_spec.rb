require 'shopping_cart'

describe ShoppingCart do
  let(:margherita) { double(:margherita_double, name: "Margherita", price: 7) }
  let(:pepperoni) { double(:pepperoni_double, name: "Pepperoni", price: 8) }
  let(:ham_and_mushroom) { double(:ham_and_mushroom_double, name: "Ham and mushroom", price: 9) }
  let(:array_of_dishes) { [margherita, pepperoni, ham_and_mushroom] }
  let(:available_dishes) { double(:available_dishes_double, array_of_dishes: array_of_dishes) }
  let(:cart) { ShoppingCart.new(available_dishes) }

  it 'raises error if requested dish not available' do
    unavailable_dish = "Unavailable dish"
    error_message = "Sorry, #{unavailable_dish} is not available"
    expect { cart.add_dish(unavailable_dish) }.to raise_error(error_message) 
  end

  it 'shows the dishes in the cart with price and total' do
    cart.add_dish("Margherita")
    cart.add_dish("Ham and mushroom")
    expected_message = "Margherita - £7\nHam and mushroom - £9\nTOTAL - £16"
    expect(cart.show_contents).to eq expected_message
  end

  # it 'totals the cost of the cart' do
  #   cart.add_dish("Margherita")
  #   cart.add_dish("Pepperoni")
  #   expect(cart.total).to eq 15
  # end

end