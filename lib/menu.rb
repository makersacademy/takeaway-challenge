# Menu class Ruby file
class Menu
  attr_reader :menu
  def initialize
    @menu = []
    @menu_option = {}
  end

  def add(item, price)
    @menu_option[item] = price
    @menu << @menu_option
  end
end
