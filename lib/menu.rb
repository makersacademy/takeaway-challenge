class Menu

  def initialize items="No menu here yet!"
    @menu_items = items
  end

  def list_items
    @menu_items.clone
  end

  def change_menu new_menu
    @menu_items = new_menu
  end

end
