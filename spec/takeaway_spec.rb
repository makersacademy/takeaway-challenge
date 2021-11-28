require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do
subject(:takeaway) {Takeaway.new(menu: menu)}
let(:menu) { double(:menu, print: example_menu, menu_items: example_menu)}
let(:example_menu) {{ pizza: 8, ramen: 6} }

  describe '#show_menu' do
    it 'shows the menu with dishes and their prices' do
    expect(subject.print_menu).to eq (example_menu)
    end 
  end

  describe '#add_to_order' do
    let(:order) { double(Order.new)}
    let(:dish) { "pizza" }
    let(:quantity) {3}
        it 'adds the dish and its quantity into my order' do 
        subject.add_to_order(dish, quantity)
        expect(subject.order.my_dishes).to include({dish => quantity })
        end
  end  
end 
