require 'formatorder'

describe FormatOrder do
  
  let(:item1) { double :item1, id: 1, name: "Margarita Pizza", price: '9.00', category: "Pizzas" }
  let(:item2) { double :item2, id: 7, name: "Garlic Bread", price: '3.00', category: "Sides" }
  let(:item3) { double :item3, id: 12, name: "Coke", price: '2.50', category: "Drinks" }
  let(:items) { { item1 => 2, item2 => 2, item3 => 2 } }
  let(:subject) { FormatOrder.new(items, 29) }

  it 'should format the order items for printing to screen' do
    expect(subject.lines).to eq ["\n", "---------------------------", "Order", "---------------------------", " 2x Margarita Pizza £  9.00", " 2x Garlic Bread    £  3.00", " 2x Coke            £  2.50", "---------------------------", "Total               £ 29.00", "---------------------------"]
  end

end
