require 'order.rb'

describe Order do
  subject(:order) { described_class.new }

  it 'adds item to total order' do
    takeaway = double("takeaway", :menu => true)
    expect(order.add_item("dough balls", 3)).to eq ({"dough balls" => 3})
  end

  it 'raises error if item is not on the menu' do
    takeaway = double("takeaway", :menu => true)
    expect{order.add_item("chicken", 1)}.to raise_error "Please only select items from the menu"
  end

  it 'can view order basket' do
    order.add_item("dough balls", 3)
    expect(order.view_basket).to eq ({"dough balls" => 3})
  end

  it 'gives a price breakdown and total price of order' do
    order.add_item("margherita", 2)
    order.add_item("dough balls", 4)
    expect(order.checkout).to eq("Your price breakdown comes to [\"margherita x 2 = £16\", \"dough balls x 4 = £20\"] which makes your total £36")
  end
end
