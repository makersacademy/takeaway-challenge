require_relative 'menu'
require_relative 'order'

class Takeaway

attr_reader :price_order, :food_order, :total_cost

  def initialize
    @menu = Menu.new
    @food_order = []
    @price_order = []
    @total_cost = 0
  end

  def open_menu
    @menu.sams_takeaway
  end

  def order_items(choice)
    fail "choice not on the menu" if !@menu.sams_takeaway.key?(choice)
    @price_order <<  @menu.sams_takeaway[choice]
    @food_order << choice
  end

  def total
    @total_cost = @price_order.inject(0){|sum,x| sum + x }
    p "Total cost = £#{@total_cost}"
    p @menu.sams_takeaway
  end


end
