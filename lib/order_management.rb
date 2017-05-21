class OrderManagement

  def order_by_commandline(order_hash,menu_items)
    order_hash[:basket].each {|item| raise "Sorry, '#{item[:name]}' is not on our menu" unless is_item_of_menu?(item[:name],menu_items)}
  end






  private

  def is_item_of_menu?(dish_name,menu_items)
    menu_items.each do |menu_item|
      return true if menu_item.name == dish_name
    end
    false
  end

end
