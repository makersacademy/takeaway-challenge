class Menu
  def initialize(menu_hash = {})
    @menu = menu_hash
  end

  def upload(menu_hash)
    @menu = menu_hash
  end

  def read
    @menu
  end

  def on_the_menu?(item)
    @menu.keys.include?(item)
  end

  def lookup(item)
    @menu[item]
  end

end
