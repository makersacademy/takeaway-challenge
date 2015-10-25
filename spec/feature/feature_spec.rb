# require 'capybara/rspec'
#
# describe 'Customer features' do
#   feature 'see name and prices of dishes on menu' do
#     scenario 'with only one item' do
#       takeaway = Takeaway.new
#       dishes = [{hamburger: ['Hamburger', 0.99]}, {chips: ['Chips', 0.75]}]
#       takeaway.add_menu_items(dishes)
#       expect(takeaway.show_menu).to eq dishes
#     end
#   end
# end
