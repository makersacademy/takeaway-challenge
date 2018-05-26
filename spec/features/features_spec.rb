require 'menu'

describe 'Menu feature tests' do
  subject(:menu) { Menu.new }

  # User Story 1:
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'shows a list of dishes with prices' do
    expect(menu.show_menu).to eq menu.juice_menu
  end

end
