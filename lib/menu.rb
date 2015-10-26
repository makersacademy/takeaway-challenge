class Menu

  def initialize
    @items = Hash.new(0)
  end

  def show_menu
    @items
  end

  def add_dish(name, price)
    @items[name] = price
  end
end
