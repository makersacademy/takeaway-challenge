require_relative 'menu'

class Order

  attr_reader :basket

  def initialize
    @basket = {}
    @menu = Menu.new
  end

  def create
    puts "What would you like to order?"
    item = gets.chomp.downcase.to_sym
    if @menu.menu.has_key?(item)
      @basket[item] = @menu.menu.delete(item)
      puts "#{item} added to basket!"
    else
      puts "#{item} is not on the menu."
    end
    @basket
  end

end