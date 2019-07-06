require_relative 'load_menu_module'

class Order
  include LoadMenu
  def initialize(restaurant:, storage_class: Hash.new)
    @order = storage_class
    load_menu(restaurant)
  end

  def add(dish, quantity)
    @order[dish] = quantity
    @order
  end

  # compares order hash against menu hash to determine the total cost of order
  def receipt
    receipt_array = []
    total = 0
    @order.each do |order_dish, order_quantity|
      @menu_hash.each do |menu_dish, menu_cost| 
        if order_dish == menu_dish
          receipt_array << "#{order_dish} x#{order_quantity} - £#{order_quantity * menu_cost.to_i}"
          total += order_quantity * menu_cost.to_i.to_i
        end
      end
    end
    receipt_array << "Total: £#{total}"
    receipt_array.join("\n")
  end
end
