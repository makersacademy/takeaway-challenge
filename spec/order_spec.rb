require 'order'

describe Order do
  let(:dish_name) { 'Jalfrezi' }
  let(:dish_price) { 7.99 }
  let(:dish) { Dish.new(dish_name, dish_price) }
  let(:menu) { Menu.new }
  before { menu.add_dish dish }

end
