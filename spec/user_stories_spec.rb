require 'menu'
require 'order'


describe Menu do

# I would like to see a list of dishes with prices

  it 'allows customer to read the menu' do
    menu = Menu.new(1)
    expect { menu.show }.not_to raise_error
  end

# I would like to be able to select some number of several available dishes

  it 'allows the customer to select their dishes' do
    menu = Menu.new(1)
    expect{ menu.choose(1) }.not_to raise_error
  end

# I would like to check that the total I have been given matches the sum of the various dishes.

  it 'presents the customer\'s order to them with total' do
    menu = Menu.new(1)
    expect { menu.final_order }.not_to raise_error
  end
end

  # I would like to receive a text after I have ordered displaying delivery time and order.
