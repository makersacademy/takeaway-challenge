describe 'User Stories' do
  it 'show a list of dishes and prices to the user' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    dish_tikka = Dish.new(name: "Tikka Masala", price: 6.95)
    dish_chow = Dish.new(name: "Chow Mein", price: 5.95)
    dishes = [dish_tikka, dish_chow]
    menu = Menu.new(dishes: dishes)
    expect{menu.show_menu}.not_to raise_error
  end

  it 'allows customer to select several dishes' do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of
    #several available dishes
    dish_tikka = Dish.new(name: "Tikka Masala", price: 6.95)
    order = Order.new
    expect{order.add(dish_tikka, 2)}.not_to raise_error
  end


# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given
# matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you!
#Your order was placed and will be delivered before 18:52" after I have ordered


end
