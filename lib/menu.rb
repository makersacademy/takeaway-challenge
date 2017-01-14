class Menu
  def initialize menu_item_class
    @menu_items = []
    @menu_item_class = menu_item_class
  end

  def menu_items
    @menu_items.dup
  end

  def add_to_menu initialization_hash
    @menu_items << menu_item_class.new(initialization_hash)
  end

  private
  attr_reader :menu_item_class
end
