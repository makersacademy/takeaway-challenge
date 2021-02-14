require 'formatmenu'

describe FormatMenu do
  
  let(:item1) { double :item1, id: 1, name: "Margarita Pizza", price: '9.00', category: "Pizzas" }
  let(:item2) { double :item2, id: 7, name: "Garlic Bread", price: '3.00', category: "Sides" }
  let(:item3) { double :item3, id: 12, name: "Coke", price: '2.50', category: "Drinks" }
  let(:items) { { 1 => item1, 2 => item2, 3 => item3 } }
  let(:subject) { FormatMenu.new(items) }

  it 'should format the menu items for printing to screen' do
    expect(subject.lines).to eq ["---------------------------", "Pizzas", "---------------------------", " 1. Margarita Pizza £  9.00", "---------------------------", "Sides", "---------------------------", " 2. Garlic Bread    £  3.00", "---------------------------", "Drinks", "---------------------------", " 3. Coke            £  2.50"]
  end

end
