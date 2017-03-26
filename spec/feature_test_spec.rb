describe 'User Stories' do

let(:menu) { Menu.new }
let(:curry) { Dish.new("Vindaloo", 8)}
let(:pizza) {Dish.new("Pepperoni Pizza", 7)}
let(:kebab) {Dish.new("Doner Kebab", 8)}
let(:cart) {Cart.new}
let(:order) {Order.new}

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'allows the user to see a list of dishes and their prices' do
    menu.add(curry)
    expect(menu.list).to include curry
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'allows the user to select items of the menu in the quantity that they specify' do
      menu.add(curry)
      menu.add(pizza)
      cart.add_to_basket(curry, 1)
      cart.add_to_basket(pizza, 2)
      expect(cart.basket).
      to eq([{:name => "Vindaloo", :price => 8, :quantity => 1},
        {:name => "Pepperoni Pizza", :price => 7, :quantity => 2}])
  end

#   As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'allows the user to confirm their order before placing it' do
    menu.add(curry)
    menu.add(pizza)
    cart.add_to_basket(curry, 1)
    cart.add_to_basket(pizza, 2)
    order = cart.checkout
    allow(order).to receive(:confirmed).and_return(true)
    allow(order).to receive(:gets).and_return("Y\n")
    expect{order.confirm}.to output("You have ordered:\nVindaloo x1\nPepperoni Pizza x2\nThe total is £22\nConfirm order? (Y/N)\nThank you for confirming your order. You can now send it.\n").to_stdout
  end


# #   As a customer
# # So that I am reassured that my order will be delivered on time
# # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  

end
