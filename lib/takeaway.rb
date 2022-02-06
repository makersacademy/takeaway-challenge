 
 class Takeaway
  def initialize
    @order_dishes = []
    @menu_dishes = nil
  end
    
  def retrieve_menu(class_of_menu = Menu)
    @menu = class_of_menu.new
    @menu.dishes
  end

  def add_order_item(dish, quantity = 1)
    retrieve_menu if @order_dishes.empty?
    ordered_dish = { dish: dish, price: @menu.dishes[dish], quantity: quantity }
    @order_dishes.push(ordered_dish)
  end

  def order_total
    total_of_order = 0
    @order_dishes.each do |order_item|
      total_of_order += (order_item[:price]) * (order_item[:quantity])
    end
    total_of_order
  end

  def checkout
    @order_dishes = []
    one_hour_from_now = Time.now + 1 * 60 * 60
    "Thank you! Your order was placed and will be delivered before #{one_hour_from_now.strftime("%k:%M")}"
  end
end
