class Menu

  attr_reader :food_options, :printer

  def initialize(printer = Printer.new)
    @printer = printer
    @food_options = [
      { Dish: "Duck_Pancakes", Price: "12" },
      { Dish: "Spring_roll", Price: "8" },
      { Dish: "Noodles", Price: "5" }
    ]
  end

   def print
     @printer.format
   end

end
