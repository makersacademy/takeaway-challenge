require_relative "menu"
require_relative "checkout"

class TakeAway
  attr_accessor :checkout
  Error = ["Item not available", "Empty menu", "Empty basket"]
  # attr_reader :order
  def initialize
    @checkout = Checkout.new #access to checkout class
    @menu = Menu.new
  end

  def menu
    @menu.show_menu
  end

  #add meal to the basket
  def add
    menu = @menu.menu
    puts "Add the name of the item"
    item = gets.chomp
    if menu.has_key?(item)
      puts "Quantity"
      quantity = gets.chomp.to_i
      puts "#{quantity} - #{item} added to your basket"
      quantity.times {
        $basket << menu[item]
      }
    else
      Error[0]
    end
  end

  def summary
    sum = @checkout.total
    @checkout.total == 0 ? Error[2] : sum.round(2)
  end

  def checkout
    if @checkout.total == 0
      "Your basket is empty"
    else
      @checkout.payment
    end
  end
end
