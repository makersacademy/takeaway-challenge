require_relative './takeaway'
require_relative './order'
class Menu
  attr_reader :dishes
  def initialize
    @dishes = {margherita: 7.00, marinara: 6.00, meatfeast: 10.50, vegetarian: 9.50}
  end

  def display_menu
    puts @dishes
    puts "Order your pizza now!"
  end

  def view_total(order)
    puts " Your total is £#{order.total_price}"
  end

end
