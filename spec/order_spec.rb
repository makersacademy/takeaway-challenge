require 'menu'

RSpec.describe Order do 

  describe '.order_items' do
    it 'can be sent to the order object' do
      order = Order.new
      expect(order).respond_to?(:order_items)
    end
  end
  # describe '.add_dish_to_order' do
  #   it 'can add dishes to an order' do
  #     dish = double(:Dish, name: 'Cheeseburger')
  #     menu.add_dish(dish)
  #     dish2 = double(:Dish, name: 'Hamburger')
  #     menu.add_dish(dish2)

  #     expect(menu).respond_to?(:dishes)
  #   end
  # end

end