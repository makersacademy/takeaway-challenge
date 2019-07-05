describe 'these are the user stories' do
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
end
