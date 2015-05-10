require 'order'

describe Order do
  it 'Dishes can be added to the order and viewed' do
  	subject.add_dish 1, "Bottle of Water"
  	subject.add_dish 2, "Disney Themed Napkins (x5)"
  	expect(subject.view_order).to include("Disney Themed Napkins (x5)" && "Bottle of Water")
  end

  it 'Multiple amounts of the same dish can be added to order' do
  	subject.add_dish 4, "Bottle of Water"
  	expect(subject.view_order).to eq ["Bottle of Water", "Bottle of Water", "Bottle of Water", "Bottle of Water"]
  end


end