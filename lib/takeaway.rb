class Takeaway

  def initialize(name)
    # Not enforced, but menu hash structure is {"dish name" => cost}
    @menu = {}
    @name = name
  end

  def add_menu_items(items)
    @menu.merge!(items)
  end

  def list_menu
    @menu
  end

  def item_price(item)
    @menu[item]
  end

  attr_reader :name

end
