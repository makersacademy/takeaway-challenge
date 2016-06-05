class Menu

  def initialize
    @menu = {}
  end

  def add_items(hash)
    @menu.update(hash)
  end

  def view_menu
    @menu
  end

end
