require_relative "order"
require_relative "twilio_txt"

class Takeaway
  attr_reader :number, :order

  def initialize(num="no_num", order_klass=Order.new, txt_klass=Sms.new)
    @number = num
    @order = order_klass
    @txt = txt_klass
  end

  def menu
    menu_string = ''
    @order.menu.each{|x,y| menu_string << ", #{x} :£#{y}"}
    "This minutes menu#{menu_string}"
  end

  def add(food, quantity=1)
    fail "nope" unless check_input(food)
    @order.add_to(food, quantity)
    current_order
  end

  def current_order
    "Current order: #{check_order}, Current total: #{check_total}"
  end

  def checkout
    message = current_order.gsub!(/Current/, "Final")
    @txt.call(@number, message)
  end

  def change_order(food, quantity)
    @order.order_log[food.to_sym] = quantity rescue "error"
  end

  def delete_order(food)
    @order.order_log.delete(food.to_sym)
  end

  private

  def check_input(food)
    order.menu.include?(food.to_sym)
  end

  def check_order
    @order.order_log
  end

  def check_total
    @order.total
  end
end
