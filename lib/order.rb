require_relative 'menu'

class Order

  attr_reader :current_order, :prices_to_sum, :total_price

  def initialize
    @current_order = []
    @prices_to_sum = []
    @total_price = 0
  end

  def add_dish(dish)
    fail "Sorry, that dish is not available" if existent_dish?(dish) == false

    @current_order << dish
    @prices_to_sum << Menu.new.menu_list[dish]
  end

  def finish_order
    sum_price
    print_order
  end

# private

  def existent_dish?(dish)
    Menu.new.menu_list.has_key?(dish) ? true : false
  end

  def sum_price
    @prices_to_sum.each do |price|
      @total_price += price
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

  # allow(subject).to receive(:empty?) { false }
  # allow(subject).to receive(:storm?) { true }

end
