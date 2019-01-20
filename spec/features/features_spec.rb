RSpec.describe "Features and user stories:" do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'so that a customer can order, display a menu for their options' do
    restaurant = Restaurant.new
    expect { restaurant.display_menu }.not_to raise_error
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it 'so that customer can order, they can select a number of the dishes they want' do
    restaurant = Restaurant.new
    restaurant.order("rat soup")
    restaurant.order("moldy bread", 2)
    expect { restaurant.current_order }.not_to raise_error
  end
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'so that a customer order total can be requested and matches the sum of the items ordered' do
    restaurant = Restaurant.new
    restaurant.order("rat soup")
    restaurant.order("moldy bread", 2)
    expect(restaurant.get_total).to eq(5)
  end
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end
