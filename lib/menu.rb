class Menu
  attr_reader :items

  def initialize
    @items = {}
  end

  def add(item, price)
    @items[item] = price
  end

  def remove(item)
    @items.delete(item)
  end

  def print_menu
    return_string = "Menu"
    @items.each_pair do |key, value|
      return_string << "\n#{key.capitalize} £#{value}"
    end
    return_string
  end
end