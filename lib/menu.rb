class Menu

  def initialize menu_item_class = MenuItem
    @current_menu = []
    @menu_item_factory = menu_item_class
  end

  def list
    current_menu.inject(''){|sum,item| sum << "#{item.name}: #{item.price}\n"}
  end

  def add item, price
    @current_menu << @menu_item_factory.new(item, price)
    nil
  end

  def remove item_name
    fail "not on menu" unless on_menu item_name
    current_menu.each{|item| current_menu.delete(item) if item.name == item_name}
    nil
  end

  private
  attr_reader :current_menu

  def on_menu? item_name
    !!current_menu.find{|item| item.name == item_name}
  end

end
