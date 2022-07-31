class Menu
  attr_reader :menu_items
  def initialize(*items)
    @menu_items = items
  end
end
