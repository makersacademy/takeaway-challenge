class Order
  def initialize(menu = Menu.new, text_message = Message.new)
    @menu_items = menu
    @text_message = text_message
  end

  def place(order_list, total_cost)
    order_cost = order_list.calculate_cost(@menu_items)
    check_total(order_cost, total_cost.to_f)
  end

  private

  def check_total(order_cost, total_cost)
    raise "order cost does not match expected cost" if order_cost != total_cost
    
    @text_message.send_text
    "order placed"
  end
end
