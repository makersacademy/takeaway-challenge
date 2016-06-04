require 'menu'

describe 'Feature' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so I decide to order, I want to see the menu' do
    menu = Menu.new
    expect(menu.show).to include('chips' => '£1')
  end
end
