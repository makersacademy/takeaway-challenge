class Menu
  attr_reader :list, :printer, :dish, :list1

  def initialize(printer = Printer.new, dish = Dish)
    @list = []
    @printer = printer
    @dish = dish
    create
  end

  def display
    list.each do |item|
      printer.display_menu(item.name, item.price)
    end
  end

  private
  # creates array of Dish objects based on DISHES
  def create
    DISHES.each do |info|
      @list << dish.new(info[0], info[1])
    end
  end

  DISHES = [["Fish and Chips", 1295],
            ["Roast Dinner", 1495],
            ["Avocado Toast", 1995]]
end
