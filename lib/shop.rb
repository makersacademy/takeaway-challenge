require_relative 'dishes'

class Shop
  def initialize
    @menu = Dishes.new('./data/dishes.csv')
    @orders = []
  end

  def show_menu
    puts @menu.describe
  end
  
  def order item_id, quantity
    @orders << Order.new unless latest_in_progress?
    dish = @menu.get_dish item_id
    @orders.last.add_item dish, quantity
  end

  private
  def latest_in_progress?
    !@orders.empty? && @orders.last.state == :in_progress
end
