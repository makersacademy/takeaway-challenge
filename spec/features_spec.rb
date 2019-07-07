describe 'User Stories' do
  let(:dish) { Dish.new("Green Curry", 5) }
  let(:other_dish) { Dish.new("Red Curry", 6) }
  let(:menu) { Menu.new }
  let(:user_order) { Order.new }
  let(:takeaway) { Takeaway.new(menu, user_order) }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'should return a list of dishes with prices' do
    4.times { menu.add_to_menu(dish) }
    expect(menu.list).to include(dish)
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it 'should let the user select dishes to add to order' do
    user_order.add_to_basket(dish)
    user_order.add_to_basket(other_dish)
    expect(user_order.basket).to eq [dish, other_dish]
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches
# the sum of the various dishes in my order
  it 'should calculate the correct total for the basket' do
    takeaway.add_to_menu(dish)
    takeaway.add_to_menu(other_dish)
    takeaway.order_dish(2)
    takeaway.order_dish(1)
    expect(takeaway.total).to eq 11
  end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed
# and will be delivered before 18:52" after I have ordered
    it 'should send a text message when order is complete' do
      takeaway.add_to_menu(dish)
      takeaway.add_to_menu(other_dish)
      takeaway.order_dish(2)
      takeaway.order_dish(1)
      expect { takeaway.complete_order }.not_to raise_error
    end


end
