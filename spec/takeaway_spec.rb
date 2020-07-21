require 'takeaway.rb'
require 'menu.rb'
require 'order.rb'
describe Takeaway do
let (:menu) {double(:menu, dishes: {"Chicken Rice"=>4.5, "Fried Chicken"=>5.5, "Fried Rice"=>2.5, "Noodle Soup"=>3.5, "Side Salad"=>1.5})}
it 'creates the instance of takeaway' do
  takeaway = Takeaway.new
end
context '#print_menu'do
it 'shows the menu'do
takeaway = Takeaway.new
  allow(menu).to receive(:print) { menu.dishes }
  expect(takeaway.print_menu).to eq menu.print
end
end
it 'place an order' do
takeaway = Takeaway.new
expect(takeaway).to respond_to :place_order
end
end
