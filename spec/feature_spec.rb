require 'menu'
require 'order'

describe 'Feature test' do
  let(:menu) { Menu.new }
  let(:order) { Order.new }

  let(:number_of_dishes) { 5 }
  let(:dish_names) { ['Dish one', 'Dish two', 'Dish three', 'Dish four', 'Dish five'] }
  let(:dish_prices) { [4.50, 5.00, 4.70, 8.00, 6.25] }
  let(:build_menu) { number_of_dishes.times {
    |i| menu.add_dish(dish_names[i], dish_prices[i])
  } }

  context 'Menu building' do
    it 'Can have five items added and then pretty prints' do
      build_menu
      expect(menu.dishes.length).to eq number_of_dishes

      expected_print_dishes_output = []
      number_of_dishes.times do |i|
        expected_print_dishes_output <<
        "#{i + 1}. #{dish_names[i]} - £#{dish_prices[i]} \n"
      end

      expect(menu.print_dishes).to eq expected_print_dishes_output.join
    end
  end

  context 'Add dishes to order' do
    it 'Add one dish to order with correct total' do
      build_menu
      order.add_to_basket(menu.dishes[0], 1)
      expect(order.basket.length).to eq 1
      expect(order.current_total).to eq dish_prices[0]
    end
    it 'Add two dishes x2 to the order and then plus of the first dish' do
      build_menu
      order.add_to_basket(menu.dishes[0], 2)
      order.add_to_basket(menu.dishes[1], 2)
      order.add_to_basket(menu.dishes[0], 1)
      expect(order.current_total).to eq(dish_prices[0] * 3 + dish_prices[1] * 2)
    end
  end
end
