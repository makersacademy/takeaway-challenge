class Menu

  # not all lines covered here - only 86%

  def initialize menu_item_class = MenuItem
    @current = []
    @menu_item_factory = menu_item_class
  end

  def list
    current.inject(''){|sum,item| sum << "#{item.name}: #{item.price}\n"}
  end

  def add item_name, item_price
    fail "already on menu" if on_menu? item_name
    @current << @menu_item_factory.new(item_name, item_price)
    nil
  end

  def remove item_name
    fail "not on menu" unless on_menu? item_name
    current.each{|item| current.delete(item) if item.name == item_name}
    nil
  end

  private
  attr_reader :current

  def on_menu? item_name
    !!current.find{|item| item.name == item_name}
  end

end
