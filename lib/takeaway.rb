require_relative 'menu'


class Takeaway

  def initialize
    @menu = Menu.new
  end

  def menu
    @menu.menu.dup
  end

  def select_items(order)
    order.map{|key,val| val * menu[key] if menu.key? key}.reduce(:+)
  end

  def place_order(order,total)
    raise "Amount given is not correct" unless total == select_items(order)
    confirm(order)
  end

private

  def confirm(order)

  end

end
