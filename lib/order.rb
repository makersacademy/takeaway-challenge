class Order
  
  attr_reader :menu_items, :customer_details
  attr_accessor :order
  attr_reader :total
  
  def initialize(menu)
    @order = []
    @menu_items = menu
    @total = 0
    @customer_details = []
  end
  
  def add_item(dish, quantity = 1)
    quantity.times do
      meal = menu_items.display_menu.select { |item| item == dish }
      order << meal
    end
    order
  end
  
  def remove_item(dish)
    order.each { |item| item.delete(dish) }
    order.delete_if { |hash| hash.empty? }
  end
  
  def add_customer_details(address, mobile)
    @customer_details = [address, mobile] if mobile =~ (/(?:\+?|\b)[0-9]{11}\b/)
  end
  
  def order_total
    @total = 0
    order.each { |item| item.each_value { |value| @total += value } }
    @total
  end
  
end
