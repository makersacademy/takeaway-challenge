require 'order'

describe Order do

let(:order){Order.new}

it 'should start with no items' do
  #expect(order.item_count).to eq 0
  expect(order.item_count).to eq 0
end

it 'should be able to add items and quantities to the order' do
  order.select_item("pizza",1)
  expect(order.item_count).to_not eq 0  
end

xit 'should ensure that only items from the menu can be selected' do


end

it 'should be able to retrieve the total price of each item ordered' do


end


it 'should be able to calculate the overall total price of the order' do


end
end