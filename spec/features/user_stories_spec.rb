require 'takeaway'

describe 'user stories' do
let(:takeaway) { Takeaway.new }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
it 'returns list of dishes with prices' do
  expect(takeaway.show_menu).to eq "Pizza : £9.99"
end
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
it 'allows a specific number of dishes to be ordered from the menu' do
  expect{takeaway.place_order}.to_not raise_error
end






end


#

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
