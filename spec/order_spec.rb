require 'order'

describe Order do
  it 'Dishes can be added to the order and viewed' do
  	subject.add_dish "Bottle of Water"
  	subject.add_dish "Disney Themed Napkins (x5)"
  	expect(subject.view_order).to include("Disney Themed Napkins (x5)" && "Bottle of Water")
  end
end