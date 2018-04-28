class Order

  attr_reader :list

  def initialize(menu = Menu.new)
    @menu = menu
    @list = []
  end

  def see_menu
    @menu.display
  end

  def add(item, number)
    raise 'item not on menu' if @menu.items.keys[item - 1] == nil
    number.times { @list << item }
  end

  def check_total

  end

end
