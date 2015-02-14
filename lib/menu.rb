class Menu

  def initialize
    @menu_items = {:Beer => 2.5, :'Chicken Nuggets' => 3}
  end

  def menu_items
    @menu_items
  end

  def menu_items_set(item = {})
    @menu_items.merge!(item)
  end

end