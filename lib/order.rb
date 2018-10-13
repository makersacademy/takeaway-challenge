require "./lib/dish.rb"
require "./lib/text.rb"

class Order

  attr_reader :orderlist
  def initialize(pricer = PriceManager.new, text = Text.new)
    @orderlist = {}
    @pricer = pricer
    @text = text
  end

  def add_dish_to_order(dish, qty = 1)
    if @orderlist.has_key?(dish)
      @orderlist[dish] += qty
    else @orderlist[dish] = qty
    end
  end

  def publish_order
    liststr = "* Welcome to your order".center(30) << "\n"
    @orderlist.each_pair do |dish, quantity|
      liststr << "* " << dish.publish_dish << " -> " << quantity.to_s << "\n"
    end
    liststr << "* TOTAL AMOUNT: " << calc_order_total.to_s
    return liststr
  end

  def calc_order_total
    @pricer.calculate_order_value(@orderlist)
  end

  def confirm_order
    @text.send_text("Order confirmed; delivery in 1 hour at #{Time.now.hour + 1}:#{Time.now.min}")
  end

  def show_all_order
    @text.show_all_texts
  end

end
