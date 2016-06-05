require 'menu'
require 'order'

describe 'Feature' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so I decide to order, I want to see the menu' do
    menu = Menu.new
    expect(menu.show).to include('chips' => 1, 'oreos' => 3, 'milkshake' => 2)
  end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so I can order a meal, I want to selects dishes' do
    order = Order.new('chips')
    order.add('milkshake', 3)
  end
  it 'so I can order a meal, I want to ensure dishes are available' do
    expect{Order.new('cake')}.to raise_error 'unknown item inputted, please enter an item on the menu'
  end
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'so I can check my order, I want to compare the total price is the sum of my items' do
    menu = Menu.new
    menu.show
    order = Order.new('milkshake', 1)
    order.add('oreos', 2)
    order.place
    #caclulator.sum_quantity
    #calculator.sum_price
    #calculator
    # checkout = Checkout.new(order, )
    #Your Order:
    # Item    Quantity   Price  Total_Price
    # oreoes     3        3         9
    # Milkshake  1        2         2

    #Order Total                    11
    # checkout.accept
    # checkout.reject
    # checkout.confirm
    # checkout.reject
  end

end
