describe 'User Stories:' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so I can check if I want to order, displays a list of dishes with prices' do
    menu = Menu.new
    expect(menu.display_menu).to eq "Fish: £7\nChips: £3"
  end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so I can order, select some number of various dishes' do
    menu = Menu.new
    expect { menu.order('Fish', 2) }.not_to raise_error
  end
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'so I can verify my order, check the total matches the sum of items ordered' do
    menu = Menu.new
    menu.order('Fish', 2)
    menu.order('Chips', 3)
    expect(menu.check_order).to eq "Fish x2 - £14\nChips x3 - £9\nTotal: £23"
  end
end
