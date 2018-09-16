class Menu
  attr_reader :items

  def initialize
    @items = {}
  end

  def add(key, item)
    @items[key] = item
  end

  def remove(key)
    @items.delete(key)
  end

  def print_menu
    return_string = "Menu"
    @items.each_value do |item|
      return_string << "\n#{item.id} £#{item.price}"
    end
    return_string
  end
end
