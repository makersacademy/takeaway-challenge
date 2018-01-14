class DishListPrinter
  def initialize(dish_printer)
    @dish_printer = dish_printer
  end

  def print(list)
    list.each do |dish|
      @dish_printer.print(dish)
    end
  end
end
