require 'order'

describe Order do
  it 'contains a list of all of it\'s dishes and is able to print it' do
    expect(subject.print_menu).to be_a_kind_of(Hash)
  end

  it 'Dishes can be added to the order and viewed' do
  	subject.add_dish 1, "Bottle of Water"
  	expect(subject.view_order).to eq [{"Bottle of Water" => 3.08}]
  end

  it 'Multiple amounts of the same dish can be added to order' do
  	subject.add_dish 4, "Bottle of Water"
  	expect(subject.view_order).to eq [{"Bottle of Water" => 3.08}, {"Bottle of Water" => 3.08}, {"Bottle of Water" => 3.08}, {"Bottle of Water" => 3.08}]
  end

  it '' do
  end

end