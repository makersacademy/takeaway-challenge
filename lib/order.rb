require "./lib/dish.rb"

class Order

  attr_reader :orderlist
  def initialize(pricer = PriceManager.new)
    @orderlist = {}
    @pricer = pricer
    puts "* Order created"
  end

  def add_dish_to_order(dish, qty = 1)
    if @orderlist.has_key?(dish)
      @orderlist[dish] += qty
    else @orderlist[dish] = qty
    end
    puts "* Order updated"
  end

  def publish_order
    liststr = "* Welcome to your order"
    @orderlist.each_pair do |dish, quantity|
      liststr << "\n" if liststr.length > 0
      liststr << "* " << dish.publish_dish << " -> " << quantity.to_s << "\n "
    end
    liststr << "* TOTAL: "<< calc_order_total.to_s
    puts liststr
    return liststr
  end

  def calc_order_total
    @pricer.calculate_order_value(@orderlist)
  end

  def confirm_order
  end

end
