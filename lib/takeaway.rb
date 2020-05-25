CUST_ORDER = []

class TakeAway

  attr_accessor :menu, :conf_order, :order
  def initialize(menu = Menu.new)
    @menu = menu.menu


  end

  def seemenu
    return @menu
  end

  def order(*args)
    CUST_ORDER << args
  end

  def see_order
    CUST_ORDER
  end

end

class Order

  def initialize(order = CUST_ORDER)
    @order = order
  end

  def cust_order
    @order
  end



end
