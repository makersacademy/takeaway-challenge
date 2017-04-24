require 'restaurant'
require 'menu'
require 'order'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, dishes: menu_items) }
  let(:menu_items) { { "Pizza" => 5.48, "Lamb Donner Kebab" => 7.30, "Chicken Wings" => 7.63, "Garlic Bread" => 3.40 } }

  describe '#read_menu' do
    it 'Displays what is on the menu' do
      expect(restaurant.read_menu).to include menu_items
    end
  end
  describe '#order' do
    it 'Adds menu items to the current order' do
      restaurant = Restaurant.new
      restaurant.order("Pizza", 2)
      expect(restaurant.current_order.items).to eq({ "Pizza" => 2 })
    end
  end
  describe '#sumarise_order' do
    it 'Prints a summary of the order' do
      subject.order("Pizza", 2)
      subject.order("Garlic Bread", 3)
      order_sum = "2x Pizza = £10.96, 3x Garlic Bread = £10.2"
      expect(subject.summarise_order).to eq order_sum
    end
  end
  describe '#order_total' do
    it 'Displays the total for the current order' do
      subject.order("Pizza", 2)
      subject.order("Garlic Bread", 3)
      expected_total = "£21.16"
      expect(subject.order_total).to eq expected_total
    end
  end
end
