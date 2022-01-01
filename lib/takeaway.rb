require './lib/dish'
require './lib/order'

class Takeaway
  attr_reader :menu_list
  
  def initialize
    @menu_list = []
  end

  def show_menu
    dishes = []
    @menu_list.each { |dish|
      dishes << "#{dish.name} - #{dish.price}"
    }
    dishes.join(', ')
  end

  def make_order
    Order.new
  end
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available **dishes**
