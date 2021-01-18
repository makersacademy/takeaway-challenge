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
      puts "How many #{item}'s would you like?"
      quantity = gets.chomp
      @basket[item] = quantity.to_i
      puts "#{item} added to basket!"
    else
      puts "#{item} is not on the menu."
    end
  end

  def cost
    @basket.each do |item, quantity|
      total = @menu.menu[item] * quantity
      puts "Basket total is £#{total}"
    end
  end

end