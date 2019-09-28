require_relative 'dish_printer'

module DishListPrinter

  include DishPrinter
  
  def print_list(list, affix= nil)
    list.each_with_index do |dish, index|
      prefix = affix || "#{index + 1}."
      puts prefix.ljust(4) + niceprint(dish)
    end
  end

end
