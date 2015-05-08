require 'capybara/rspec'
require 'menu'
require 'print'

feature 'customer see the menu with prices' do
  let(:menu) { Menu.new }
  let(:menu_list) { menu.menu }
  let(:order) { Order.new menu_list }
  let(:order_list) { order.place_order 1 }
  let(:print) { Print.new }

  scenario 'list of dishes and prices is a hash' do
    expect(menu_list).to be_a Hash
  end

  scenario 'menu is printed so customer is able to see it' do
    expect(print.display_menu menu_list).to include("1. Roasted pork - £8")
  end

  scenario 'customer can make order of number of dishes' do
    expect(print.display_order order_list).to eq("1. Roasted pork - £8")
  end
end
