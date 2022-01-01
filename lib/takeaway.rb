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
# So that I can verify that my order is correct
# I would like to check that the **total** 
# I have been given matches the sum of the 
# various **dishes** in my **order**