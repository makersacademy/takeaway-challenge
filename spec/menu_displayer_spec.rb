require "menu_displayer.rb"

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe MenuDisplayer do

  let(:menu_displayer) { MenuDisplayer.new }
  let(:menu) { Menu.new }

  it 'should respond to display' do
    expect(menu_displayer).to respond_to(:display)
  end

  it 'should display a list of dishes with prices' do
    expect([menu_displayer.display]).to include(menu.list[0..5])
  end

end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
