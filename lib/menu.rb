require_relative 'dishes'
require_relative 'order'

class Menu
  attr_reader :dishes_list, :new_order

  def initialize(dishes_list = Dishes.new)
    @dishes_list = dishes_list
    @new_order = []
  end

  def print_available_dishes
    @dishes_list.dishes.each do |dish|
      puts "#{dish[:id]}.#{dish[:name]}: £#{dish[:price]}"
    end
  end

  def select_dish(dish_id, amount)
    amount.times do
      @dishes_list.dishes.each do |dish|
        if dish[:id] == dish_id
          @new_order << { dish[:name] => dish[:price] }
          dish[:available] = dish[:available] - 1
        end
      end
    end
  end
end
