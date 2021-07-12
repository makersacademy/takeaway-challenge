require_relative 'menu'

class Basket

  attr_reader :dishes, :total

  def initialize
    @menu = Menu::MENU
    @dishes = {}
  end

  def place_order
    puts "Please select an item from the menu."
    @item = gets.chomp
    puts "How many would you like?"
    @quantity = gets.chomp
    @dishes[@item] = @quantity
    puts "#{@quantity} #{@item}(s) added to your basket"
    p @dishes
  end

  def sum_order
    arr = @dishes.map { |k, v| @menu[k.to_sym] * v.to_f }
    @total = arr.sum
    p "Your total for this order is £#{@total}"
  end
end
