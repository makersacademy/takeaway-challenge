class Order

  attr_reader :my_order

  def initialize(menu)
    @my_order = []
    @menu = menu
  end

  def add(item, number = 1)
    number.times {my_order << @menu.dishes.find {|dish| dish.name == item }}
  end

  def order_cost
    @total = 0
    my_order.each do |item|
      @total += item.price
    end
    @total
  end

  def confirm(pay)
    pay_err = "You have not paid enough, The total is £#{'%.2f' % order_cost}"
    fail pay_err if not_enough?(pay)
    conf_message = "Thankyou for your order, "\
    "It will be delivered by #{del_time}"
    conf_message
  end

  private
  def not_enough?(pay)
    pay != order_cost
  end

  def del_time
    (Time.now + 3600).strftime("%H:%M")
  end
end
