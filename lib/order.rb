require_relative "message"
class Order

  def initialize(menu, message_class=Message)
    @my_order = []
    @menu = menu
    @message_class = message_class
  end

  def my_order
    @my_order.dup
  end

  def add(item, number = 1)
    message = "This item is not on the menu"
    fail message unless on_menu?(item)
    number.times {dish_finder(item)}
  end

  def order_cost
    @total = 0
    my_order.each do |item|
      @total += item.price
    end
    @total
  end

  def confirm(pay)
    pay_err = "You have not paid enough, "\
    "The total is £#{format('%.2f', order_cost)}"
    fail pay_err if not_enough?(pay)
    @message_class.new(del_time).send
  end

  private

  def not_enough?(pay)
    pay != order_cost
  end

  def del_time
    (Time.now + 3600).strftime("%H:%M")
  end

  def on_menu?(item)
    @menu.dishes.any? {|dish| dish.name == item}
  end

  def dish_finder(item)
    @my_order << @menu.dishes.detect {|dish| dish.name == item }
  end
end
