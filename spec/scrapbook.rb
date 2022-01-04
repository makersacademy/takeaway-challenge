#1 -- Initial order is empty.

it 'Initial order is empty' do
    expect(takeaway.order_item).to be_empty
end

#2 if I want to just retrieve all the keys or all the values out of a hash:
hash.values

h.each_value {|value| puts value }


#3 To raise an error if incorrect choice
    #it 'raises an error message if item is not on the menu' do
    #    expect { takeaway.order_item(1) }.to raise_error "Item is not currently on the menu."           
    #end

#4 