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

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as 
# "Thank you! Your order was placed and will be delivered before 18:52"
#  after I have ordered