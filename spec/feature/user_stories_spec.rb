describe 'User Stories' do
  let(:takeaway){Takeaway.new}
  let(:menu){Menu.new}
  let(:order){Order.new}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'takeaway has menu with dishes and prices' do
    expect(takeaway).to respond_to(:see_menu)
  end

  it 'initialize with no dishes listed'do
    expect(menu.dishes).to be_empty
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'should be able to order three of the same menu item'

end
