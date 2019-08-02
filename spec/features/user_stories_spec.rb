require './lib/takeaway.rb'
describe Takeaway do
let(:takeaway) { described_class.new }
let(:pizza1) {:pepperoni}
let(:pizza2) {:hawaiian}

context 'User story 1' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
it 'Should have a list of prices' do
  expect(takeaway.menu).to eq ({:pepperoni => 10, :hawaiian => 12, :meat_feast => 15})
end
end
context 'User Story 2' do
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
it 'Should allow menu selection' do
  takeaway.menu_select(pizza1)
  expect(takeaway.order).to eq [:pepperoni => 10 ]
end

it 'Should allow order amount selection' do
  takeaway.menu_select(pizza2, 2)
  expect(takeaway.order).to eq [{:hawaiian => 12}, {:hawaiian => 12}]
end
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order




end
