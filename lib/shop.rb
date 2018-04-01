require_relative 'dishes'
require_relative 'order'

class Shop

  MESSAGES = { empty_menu: 'No dishes currently available', invalid_quantity: 'Error: please enter a valid quantity (1 -12)', invalid_id: "Error: please enter a valid dish number from the menu\n", no_items: 'No items ordered', no_orders: 'No orders available', cannot_modify: 'No orders in progress', invalid_item_id: "Error: please enter a valid order item number" }

  def initialize
    @menu = Dishes.new('./data/dishes.csv')
    @orders = []
  end

  def show_menu
    begin
      puts @menu.describe
    rescue
      puts MESSAGES[:empty_menu]
    end
  end
  
  def order item_id, quantity
    return MESSAGES[:invalid_quantity] if !((1..12) === quantity)
    @orders << Order.new unless latest_in_progress?
    begin
      dish = @menu.get_dish item_id
      puts @orders.last.add_item dish, quantity
    rescue
      puts MESSAGES[:invalid_id]
    end
  end

  def remove item_id
    begin 
      return MESSAGES[:cannot_modify] unless latest_in_progress? 
      @orders.last.remove_item item_id
    rescue
      MESSAGES[:invalid_item_id]
    end
  end 
      

  def checkout
    return MESSAGES[:no_items] unless can_checkout?
    @orders.last.complete!
    puts "Thanks for the order. Your total is £%<total>.2f. You will shortly receive a confirmation message." % { total: @orders.last.calculate_total }
  end
  
  def show_bill
    return MESSAGES[:no_orders] if @orders.empty?
    puts @orders.last.describe
  end
 
  private
  def latest_in_progress?
    !@orders.empty? && @orders.last.state == :in_progress
  end

  def can_checkout?
    !@orders.empty? && @orders.last.state == :in_progress && @orders.last.calculate_total > 0
  end
end
