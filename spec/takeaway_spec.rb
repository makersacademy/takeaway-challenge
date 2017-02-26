require 'takeaway'
# require 'stringio'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu, check_menu: "Burger", price: 7, dishes: {"Burger" => 7} }
  let(:item) { double :dish }

describe '#view_menu' do
  it 'returns the menu' do
    expect(takeaway.view_menu).to eq({"Burger" => 7})
  end
end

describe '#add_to_order' do
  it 'adds a menu item to the order' do
    takeaway.add_to_order(item)
    expect(takeaway.basket).to include item
  end
  it 'adds multiple items to the order' do
    takeaway.add_to_order(item, 4)
    expect(takeaway.basket).to include item
  end
  it 'collects items of the same type' do
    2.times {takeaway.add_to_order(item)}
    expect(takeaway.basket).to eq({ item => 2 })
  end
end


end
