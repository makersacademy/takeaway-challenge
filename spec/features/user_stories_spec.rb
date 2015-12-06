
describe 'User Stories' do

  let(:takeaway) { Takeaway.new(menu, order) }
  let(:menu) { Menu.new }
  let(:order) { Order.new }
  let(:dish) { Dish.new('Pad Thai', 5.00) }
  let(:dish2) { Dish.new('Green Curry', 6.00) }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe 'Takeaway' do
  it 'allows the customer to view the menu with prices' do
    menu.add(dish)
    expect(takeaway.view_menu).to include dish
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'allows the customer to view their order' do
    expect(takeaway).to respond_to(:view_order)
  end

  it 'allows the customer to order a number of dishes' do
    menu.add(dish)
    takeaway.order(dish.name, 2)
    expect(order.basket).to include dish
  end

  # # As a customer
  # # So that I can verify that my order is correct
  # # I would like to check that the total I have been given matches the sum of the various dishes in my order

end



  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  describe 'Sms' do
    xit 'sends an SMS confirmation when an order is placed' do
    end
  end
end


# xit 'raises an error if the total does not equal the sum of dishes in the basket' do
#   basket.total to raise_error
# end
#
