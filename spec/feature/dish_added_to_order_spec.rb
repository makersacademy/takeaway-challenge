# require 'capybara/rspec'
# require 'dish'
# # require 'restaurant'
# feature 'Restaurant dish can be added to order and total shown' do
#   let(:restaurant) { Restaurant.new }
#   let(:dish) { Dish.new("Chicken curry") }
#   let(:order) { Order.new }
#   before(:each) do
#     restaurant.load_dishes(dish)
#   end
#   scenario '#add_dish to ::order' do
#     restaurant.dishes
#     expect(order.add_dish(dish)).to be_an_instance_of OrderItem
#   end
#   scenario 'add more than 1 of an item' do
#     order.add_dish(dish)
#     item = order.add_dish(dish)
#     expect(item.quantity).to eq 2
#   end
# end
