require_relative 'dishes'
require_relative 'order'

class Shop

  MESSAGES = { empty_menu: 'No dishes currently available', invalid_quantity: 'Error: please enter a valid quantity (1 -12)', invalid_id: "Error: please enter a valid dish number from the menu\n" }

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

  private
  def latest_in_progress?
    !@orders.empty? && @orders.last.state == :in_progress
  end
end
