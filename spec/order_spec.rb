describe Order do
  subject(:order) { described_class.new }

  it '#add_item updates total with the price of the item' do
    menu_entry = { description: 'Roast pork',       price: 15 }
    expect{ order.add_item(menu_entry) }.to change{order.total}.by menu_entry[:price]
  end

end 
