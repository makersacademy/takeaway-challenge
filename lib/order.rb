class Order

  attr_reader :list

  def initialize
    @menu = Menu.new
    @list = []
  end

  def see_menu
    @menu.display
  end

  def add(item, number)
    raise 'item not on menu' unless @menu.items.has_key?(item)
    number.times { @list << item }
  end

end
