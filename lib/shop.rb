require_relative 'dishes'
require_relative 'order'
require_relative 'communicator'

class Shop

  MESSAGES = { empty_menu: 'No dishes currently available', invalid_quantity: 'Error: please enter a valid quantity (1 -12)', invalid_dish_id: "Error: please enter a valid dish number from the menu\n", no_items: 'No items ordered', no_orders: 'No orders available', cannot_modify: 'No orders in progress', invalid_item_id: "Error: please enter a valid order item number", confirm: "Thanks for the order. You will receive a confirmation message shortly\n" }

  def initialize
    @menu = Dishes.new('./data/dishes.csv')
    @orders = []
    @communicator = Communicator.new
  end

  def show_menu
    puts ( begin
      @menu.describe
    rescue
      MESSAGES[:empty_menu]
    end)
    self
  end
  
  def order dish_id, quantity = 1
    return MESSAGES[:invalid_quantity] if !((1..12) === quantity)
    @orders << Order.new unless latest_in_progress?
    puts (begin
      latest.add_item (@menu.get_dish dish_id), quantity
    rescue
      MESSAGES[:invalid_dish_id]
    end)
  end

  def remove item_id
    begin 
      return MESSAGES[:cannot_modify] unless latest_in_progress? 
      latest.remove_item item_id
    rescue
      MESSAGES[:invalid_item_id]
    end
  end 
      

  def checkout
    return MESSAGES[:no_items] unless can_checkout?
    latest.complete!
    @communicator.send latest_total
    puts MESSAGES[:confirm]
  end
  
  def show_bill
    return MESSAGES[:no_orders] if @orders.empty?
    puts latest.describe
  end
  
  alias show_order show_bill
 
  private
  def latest
    @orders.last
  end

  def latest_in_progress?
    !@orders.empty? && latest.state == :in_progress
  end

  def latest_total
    latest.calculate_total
  end

  def can_checkout?
    !@orders.empty? && latest.state == :in_progress && latest_total > 0
  end
end
