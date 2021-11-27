require_relative 'dishes'

class Menu
  attr_reader :dishes, :order

  def initialize
    @dishes_list = Dishes.new
    @order = []
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
          @order << dish[:name]
        end
      end
    end
  end
end
