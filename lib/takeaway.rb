class TakeAway

  attr_reader :menu, :cust_order, :conf_order
  def initialize(menu = Menu.new)
    @menu = menu.menu
    @conf_order = []
  end

  def seemenu
    return @menu
  end

  def order(*args)
    @conf_order << args
  end

  def see_order
    @conf_order
  end

end
