require_relative 'menu'

class Takeaway

attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def menu_list
    @menu.show
  end

#Move methods to order class
  def add(dish, amount)
    fail 'Thats not on the menu!' if menu.do_we_have(dish) == false
    @order << {item: dish, qty: amount, total: (amount * menu.price(dish))}
  end

  def add_dish(dish, amount)
    @order << {item: dish, qty: amount, total: (amount * menu.price(dish))}
  end

  def total
    sum = 0
    @order.collect { |order| sum += order[:total] }
    return "Your order total is " + ("£%.2f" % [sum])
  end

end
