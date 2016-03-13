class Takeaway

  def initialize(menu= Menu.new, order_klass=Order)
    @menu = menu
    @order_klass = order_klass
    @order = @order_klass.new
  end


end
