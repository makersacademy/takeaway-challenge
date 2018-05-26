require './lib/menu.rb'

describe 'Menu Features' do

  subject(:menu) { Menu.new }

# ** User Story 1 **
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'can create a menu' do
    expect { Menu.new }.not_to raise_error
  end

  it 'can contain a list of dishes with corresponding prices' do
    expect { menu.dishes }.not_to raise_error
  end

  it 'contains an array of hashes for the menu structure' do
    expect(menu.dishes).to include({ "Chicken Tikka" => 8.99 })
  end

  it 'contains an array of hashes for the menu structure' do
    expect(menu.dishes).to include({ "Dry Meat" => 10.99 })
  end

  it 'can display a the list of dishes available for order' do
    expect { menu.display }.not_to raise_error
  end

  it 'displays the whole menu available' do
    expect(menu.display).to include(menu.dishes.to_s)
    #   { "Chicken Tikka" => 8.99 },
    #   { "Dry Meat" => 10.99 },
    #   { "Mixed Grill" => 14.99 },
    #   { "Chana Dal" => 7.99 },
    #   { "Peshwari Naan" => 3.99 },
    #   { "Garlic Naan" => 3.49 },
    #   { "Plain Rice" => 2.00 }
    # )
  end

  it 'presents the menu in a customer friendly format' do
    expect(menu.display).to eq "Ty Abs - Whitechapel
Takeaway Menu
#{menu.dishes.inspect}
Please order before 10pm
Delivery is available in the E2 area"
  end

end
