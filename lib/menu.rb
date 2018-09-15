class Menu
  LIST = [
    { name: "Fish and Chips", price: 1295 },
    { name: "Roast Dinner",   price: 1495 },
    { name: "Avocado Toast",  price: 1995 },
    ]

  attr_reader :list, :printer

  def initialize(printer = Printer.new, list = LIST)
    @list = list
    @printer = printer
  end

  def display
    list.each do |dish|
      printer.display
    end
  end
end
