require 'takeaway'
require 'menu'

describe 'User Stories' do
  let(:menu) { Menu.new }
  let(:takeaway) { Takeaway.new(menu) }

  before (:each) do
    menu.add_dish("Hamburger Meal", 5)
    menu.add_dish("Chickenburger Meal", 5)
  end

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
    xit 'so customers can order, it displays a list of prices' do
      expect(takeaway.print_menu).to eq "1. Hamburger: £5"
    end
end
