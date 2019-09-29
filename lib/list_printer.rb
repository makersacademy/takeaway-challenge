require_relative 'dish_print'

module ListPrinter

  include DishPrint

  def print_list(list, stuck = nil)
    list.each_with_index do |dish, index|
      numbering = stuck || "#{index + 1}. "
      puts numbering + printer(dish)
    end
  end
end
