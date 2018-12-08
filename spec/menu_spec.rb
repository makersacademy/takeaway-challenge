# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

require "menu.rb"

describe Menu do

  let(:menu) { Menu.new }

  it 'should display a list of dishes with prices' do
    expect(menu.display_menu).to eq(menu.menu)
  end

end
