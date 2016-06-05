require 'menu'
# I would like to see a list of dishes with prices
# I would like to check that the total I have been given matches the sum of the various dishes in my order
# I would like to receive a text after I have ordered displaying delivery time and order.
describe Menu do
  it 'allows customer to read the menu' do
    menu = Menu.new
    expect { menu.display }.not_to raise_error
  end

# I would like to be able to select some number of several available dishes

  it 'opens the menu' do
    menu = Menu.new
    expect {menu.select }.not_to raise_error
  end
end
