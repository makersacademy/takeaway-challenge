class Menu

  attr_reader :menu_items

  def initialize
    @menu_items ={
      :margherita => 6.00,
      :venezia => 6.70,
      :athena => 8.20,
    }
  end

  def view_menu
    @menu_items
  end

end
