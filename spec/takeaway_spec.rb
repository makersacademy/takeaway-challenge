require 'takeaway'
require 'dish'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, order)}
  let(:order) { double :order, selected_dishes: [dish, dish2]}
  let(:menu) { double :menu, print_menu: printed_menu, dishes: [dish, dish2]}
  let(:printed_menu) { "Pizza: £7.99" }
  let(:dish) { Dish.new(name: "Pizza", price: 7.50) }
  let(:dish2) { Dish.new(name: "Soup", price: 3.20) }
  let(:dish1) { double :dish }
  
  it 'shows the menu' do
    expect(takeaway.show_menu).to eq printed_menu
  end
  
  describe "#place_order" do
    context "when dish not in menu" do
      it 'raises an error' do
        expect { takeaway.place_order(dish1, 4) }.to raise_error "The dish is not in the menu"
      end
    end

    context "when dish in menu" do
      it 'gives it a quatity' do
        dish.quantity = 4
        expect(takeaway.place_order(dish, 4)).to eq dish
      end
    end
  end
end