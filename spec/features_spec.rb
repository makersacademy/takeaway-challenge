describe 'User Stories' do
  let(:dish) { Dish.new("Green Curry", 5) }
  let(:other_dish) { Dish.new("Red Curry", 6) }
  let(:menu) { Menu.new }
  let(:final_order) { Takeaway.new }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'should return a list of dishes with prices' do
    4.times { menu.add_dish(dish) }
    expect(menu.list).to include(dish)
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it 'should let the user select dishes to add to order' do
    menu.add_dish(dish)
    menu.add_dish(other_dish)
    expect(menu.order(1)).to eq(dish)
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches
# the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed
# and will be delivered before 18:52" after I have ordered
end
