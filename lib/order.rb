require_relative 'menu'

class Order

  attr_reader :current_order
  attr_accessor :total_price, :prices_to_sum

  def initialize(menu = Menu.new)
    @current_order = []
    @prices_to_sum = []
    @total_price = 0
    @menu = menu
  end

  def add_dish(dish, amount)
    fail "Sorry, that dish is not available" if @menu.existent_dish?(dish) == false

    amount.times do
      @current_order << "#{dish} ...... £#{@menu.menu_list[dish]}"
      @prices_to_sum << @menu.menu_list[dish]
    end
  end

  def finish_order
    sum_price
    print_order
  end

# private (HOW TO CALL THEM FROM TESTS?)

  def sum_price
      p "**************"
    p @prices_to_sum
    @prices_to_sum.each do |price|

      p price
      @total_price += price
      p @total_price
    end
  end

  def print_order
    puts "THANKS FOR YOUR ORDER"
    @current_order.each { |item| puts item }
    puts "Total: £#{@total_price}"
  end

  # LOOP TO CALL FROM RESTAURANT CLASS AND PLACE_ORDER

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
