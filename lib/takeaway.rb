class Takeaway

  attr_reader :menu

  def initialize
    @menu = {item: 7, item2: 4}
    @order_total = 0
    @current_order = []
  end

  def add_to_order *order
    order.each {|item| @current_order << item}
    @order_total += check_availablity_and_add_items order
  end

  def check_order
    order_msg = 'Your order: '
    @current_order.each {|item| order_msg << "#{item}, "}
    order_msg
  end



  private
  def on_menu? order
    @menu.keys.include? order
  end

  def check_availablity_and_add_item item
    fail "we ain't got #{item}" unless on_menu? item
    @menu[item]
  end

  def check_availablity_and_add_items order
    order.inject(0) {|sum,item| sum += check_availablity_and_add_item item}
  end

end
