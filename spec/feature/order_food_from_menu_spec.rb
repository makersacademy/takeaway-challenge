require 'capybara/rspec'
require 'takeaway'
require 'menu'
require 'print'

feature 'customer see the menu with prices' do
  # let(:takeaway) { Takeaway.new }
  let(:menu) { Menu.new }

  scenario 'menu has a list of dishes and prices' do
    expect(menu.menu).to be_a Hash
  end

  xscenario 'menu is printed so customer is able to see it' do

    expect(print.display_menu).to include("1. Roasted pork - £8")
  end

  scenario 'customer can make order of number of dishes' do

  end
end
