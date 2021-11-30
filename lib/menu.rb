class Menu
  attr_accessor :menu, :food, :price, :view_menu
    
  def initialize
    @menu = Hash.new
    #@order_selection = []
    #@total_price = []
    #@sum = 0
  end

  def add_food(food, price)
    @menu[food] = price
  end

  # def add_order(food)
  #   if @menu.include?(food) == false
  #     raise "the order is not in the menu"
  #   end
  #   @order_selection.push(food)
  # end

  # def order_selected
  #   @order_selection
  # end

  # def total_order
  #   @order_selection.each do |food| @total_price << @menu[food]
  #   end
  #   @total_price.each { |bill| @sum += bill }
  #   return @sum
  # end

  def view_menu
    @menu
  end
end
