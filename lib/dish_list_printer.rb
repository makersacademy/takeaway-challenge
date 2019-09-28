require_relative 'dish_printer'

module DishListPrinter
  include DishPrinter
  def print_list(list)
    list.each_with_index do |dish, index|
      puts "#{index + 1}.".ljust(4) + niceprint(dish)
    end
  end
end