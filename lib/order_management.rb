class OrderManagement

  def initialize(notification_tool = SmsSender.new)
    @notification_tool = notification_tool
  end

  def order_by_commandline(order_hash, menu_items)
    order_hash[:basket].each { |item| raise "Sorry, '#{item[:name]}' is not on our menu" unless item_of_menu?(item[:name], menu_items) }
    raise "Sorry, your total was incorrect. Order was not placed" unless calculate_total(order_hash, menu_items) == order_hash[:total]
    message = "Thank you! Your order was placed and will be delivered before "+"#{Time.now.strftime('%H').to_i + 1}"+":"+Time.now.strftime('%M')+"."
    @notification_tool.send(message)
    message + " A confirmation was sent to your phone as a text."
  end

  private

  def calculate_total(order_hash, menu_items)
    total = 0
    order_hash[:basket].each do |name_quantity_pair|
      menu_items.each do |item|
        if name_quantity_pair[:name] == item.name
          total += item.price * name_quantity_pair[:quantity]
        end
      end
    end
    total
  end

  def item_of_menu?(dish_name, menu_items)
    menu_items.each do |menu_item|
      return true if menu_item.name == dish_name
    end
    false
  end
end
