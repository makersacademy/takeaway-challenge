require './lib/dish'
require './lib/order'

class Takeaway
  attr_reader :menu_list
  
  def initialize
    @menu_list = []
  end

  def show_menu
    dishes = []
    @menu_list.each { |dish| dishes << "#{dish.name} - #{dish.price}" } 
    dishes.join(', ')
  end

  def make_order
    Order.new
  end
end
