class OrderManagement

  def order_by_commandline(order_hash, menu_items)
    order_hash[:basket].each {|item| raise "Sorry, '#{item[:name]}' is not on our menu" unless is_item_of_menu?(item[:name],menu_items)}
    raise "Sorry, your total was incorrect. Order was not placed" unless calculate_total(order_hash, menu_items) == order_hash[:total]
  end

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






  private

  def is_item_of_menu?(dish_name, menu_items)
    menu_items.each do |menu_item|
      return true if menu_item.name == dish_name
    end
    false
  end



end
