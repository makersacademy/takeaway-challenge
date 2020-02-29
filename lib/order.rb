require_relative 'menu'

class Order

  attr_reader :current_order, :prices_to_sum

  def initialize
    @current_order = []
    @prices_to_sum = []
  end

  def add_dish
    while true do
      puts "Select a dish (type end to finish)"
      dish = gets.chomp.to_s
      break if dish == "end"

      if existent_dish?(dish) == false
        puts "Sorry, that dish is not available"
      end
      @current_order << dish
      @prices_to_sum << $menu_list[dish]
    end
  end

  def existent_dish?(dish)
    $menu_list.has_key?(dish) ? true : false
  end

  def finish_order
  end

end
