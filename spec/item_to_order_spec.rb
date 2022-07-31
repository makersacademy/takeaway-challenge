require 'item_to_order'
require 'menu'

describe ItemToOrder do

  let(:quantity) { double :quantity }
  let(:menu) {double :menu, add_dish: [{dish: "chips", price: 3 }], is_available?: true}
  let(:dish1) { double :dish1, dish: "burger", price: 5, dish_for_menu: [dish: "burger", price: 5]}
  let(:dish2) { double :dish2, dish: "chips", price: 3, dish_for_menu: [dish: "chips", price: 3]}
  let(:list_of_dishes) { double list_of_dishes: [{dish: "chips", price: 3}] }
  let(:menu2) { double :menu2, is_available?: false}
  let(:menu3) { double :menu3, add_dish: [{dish: "chips", price: 3 }, {dish: "burger", price: 5}], is_available?: true}

  describe '#order' do
    it 'when user orders a meal the details are stored' do
      menu.add_dish(dish2)
      order = ItemToOrder.new(dish2, quantity)
      order.order
      expect(order.item_to_order.length). to eq 2
    end
  end

  describe '#check_if_available' do
    it 'raises error message if dish is not available' do
      order = ItemToOrder.new(dish2, quantity)
      order.order
      expect{ order.check_if_available(menu2) }.to raise_error 'Sorry this item is not available to order'
    end
  end

end
