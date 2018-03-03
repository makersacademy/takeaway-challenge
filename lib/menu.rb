class Menu
  attr_reader :menu

  def initialize(printer)
    @printer = printer
    @menu = [
      { item: "Devil's Cauliflower", price: 4 },
      { item: "Rainbow Pot", price: 3 },
      { item: "Oreo Brownie", price: 3 },
    ]
  end

  def display_menu
    @printer.formatter(@menu)
  end
end
