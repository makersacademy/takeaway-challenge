require 'order'

describe Order do

let(:order){Order.new}

it 'should start with no items' do
  expect(order.item_count).to eq 0
end

it 'should be able to add items and quantities to the order' do
  order.selection("Margarita",1)
  expect(order.item_count).to eq 1  
end

it 'should ensure that only items from the menu can be selected' do
  order.selection("Bob",2)
  order.selection("Margarita",1)
  expect(order.item_count).to eq 1
end

it 'should be able to retrieve the total price of each item ordered' do
  order.selection("Margarita",2)
  expect(order.get_item_prices).to eq [12.0]
end

it 'should be able to calculate the overall total price of the order' do
  order.selection("Margarita",2)
  order.selection("Pepperoni",2)
  expect(order.get_overall_price).to eq 26.0
end

#to complete on Monday (mocks / stubs)
xit 'should be able to send a text message with the delivery confirmation' do

end

end