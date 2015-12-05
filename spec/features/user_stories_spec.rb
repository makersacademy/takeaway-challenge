
describe 'User Stories' do

  let(:takeaway) { Takeaway.new }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

it 'allows customers to view a menu' do
  expect { takeaway.menu }.not_to raise_error
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

it 'allows a customer to add an item to an order' do
  expect { takeaway.add_to_order }.not_to raise_error
end


# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

end
