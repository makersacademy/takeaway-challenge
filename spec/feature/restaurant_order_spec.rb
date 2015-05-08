require 'capybara/rspec'
require 'restaurant'
require 'menu'
require 'customer'
require 'dish'
require 'order'

feature 'Restaurant ordering' do
  let(:menu) { Menu.new }
  let(:dish1) { Dish.new 'Murtabak', 10, 'Its so tasty!' }
  let(:dish2) { Dish.new 'Ice cream', 5, 'Omg yum' }
  let(:dish3) { Dish.new 'Frunsh Fries', 5, 'Triple freid' }
  let(:alex) { Customer.new }
  let(:order) { Order.new alex }

  xscenario 'Restaurant has a menu'
  xscenario 'Restaurant can create a new order'
  xscenario 'Restaurant can mark an order as ready'
  xscenario 'Restaurant has the order under completed orders when ready'
  xscenario 'Order no longer under pending orders when ready'
end
