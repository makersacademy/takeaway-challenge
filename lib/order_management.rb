class OrderManagement

  def order_by_commandline(order_hash)
  end






  private

  def is_item_of_menu?(dish_name,menu_items)
    menu_items.each do |menu_item|
      return true if menu_item.name == dish_name
    end
    false
  end

end
