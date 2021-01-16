class Takeaway
  MENU = {
    Hotdog: 5
  }
  def menu
    MENU
  end

  def order
    @order = Order.new
  end
end
