require_relative 'menu'

class Order

  attr_reader :current_order, :prices_to_sum

  def initialize
    @current_order = []
    @prices_to_sum = []
  end

  def add_dish(dish)
    fail "Sorry, that dish is not available" if existent_dish?(dish) == false

    @current_order << dish
    @prices_to_sum << Menu.new.menu_list[dish]
  end

  def existent_dish?(dish)
    Menu.new.menu_list.has_key?(dish) ? true : false
  end

  # def add_dish
  #   while true do
  #     puts "Select a dish (type end to finish)"
  #     dish = gets.chomp.to_s
  #     break if dish == "end"
  #
  #     if existent_dish?(dish) == true
  #       @current_order << dish
  #       @prices_to_sum << Menu.new.menu_list[dish]
  #     else
  #       puts "Sorry, that dish is not available"
  #     end
  #   end
  # end

end
