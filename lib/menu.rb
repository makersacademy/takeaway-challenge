class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = {:Beer => 2.5, Cod: 3}
  end

  def menu_items_set(item = {})
    @menu_items.merge!(item)
  end

end