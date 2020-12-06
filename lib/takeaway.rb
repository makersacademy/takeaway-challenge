require_relative "menu"
require_relative "checkout"

class TakeAway
  attr_accessor :checkout
  Error = ["Meal Not Found, try again", "Empty menu", "Empty basket"]
  # attr_reader :order
  def initialize
    @checkout = Checkout.new #access to checkout class
    @menu = Menu.new
  end

  def menu
    fail Error[1] if @menu.show_menu.empty?
    @menu.show_menu
  end

  #add meal to the basket
  def add(meal)
    item = @menu.menu
    item = item[meal]
    fail Error[0] if meal.empty?
    puts "#{item} added to your basket"
    #basket is global to added in checkout
    $basket << item
  end

  # def check_basket
  #   checkout.added
  # end

  def summary
    fail Error[2] if $basket.size == 0
    @checkout.total
  end

  def payment(price)
    @checkout.payment
  end
end
