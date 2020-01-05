class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order  #if not exist defautl make new instance of class Order.new
  end

  def print_menu
    menu.print
  end

  def place_order(dishes) #pushing order to order class attribute
    dishes.each do |dish, quantity|
      order.add(dish, quantity) #use quanitly set value rarther than add same item x#times - ax4 / a,a,a,a
    end
  end


  private

  attr_reader :menu, :order

end