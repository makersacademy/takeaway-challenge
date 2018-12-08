require "menu.rb"

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe Menu do

  let(:menu) { Menu.new }

  it 'should display a list of dishes with prices' do
    expect(menu.display_menu).to eq(menu.menu)
  end

end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
