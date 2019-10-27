class Takeaway

attr_reader :menu, :order, :calculate_total, :confirmation

  def initialize(menu:, order:, confirmation:)
    @menu = menu
    @order = order
    @confirmation = confirmation
  end

  def print_menu
    menu.print
  end

  def receive_order(items)
    items.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end
  
  def calculate_total(items)
    order.total
  end
  
  def send_confirmation(order)
    confirmation.deliver
  end
end