describe 'these are the user stories' do

  let(:menu) { Menu.new }
  let (:dish) { double :dish }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

it 'see a list of dishes' do
  menu.menu.push(dish)
  expect(menu.menu).to include dish
end


# OBJECT: list of dishes with prices, customer
# MESSAGE: order , see

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
# OBJECT: the desired meal
# MESSAGE: select some number of dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
# OBJECT: order correct?
# MESSAGE: verify, total vs the sum of the various dishes ordered

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as
#  "Thank you! Your order was placed and will be delivered before 18:52"
#  after I have ordered
# OBJECT: confirmation message upon order
# MESSAGE: receive text
end
