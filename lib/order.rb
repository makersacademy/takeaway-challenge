require_relative 'menu'

class Order

  attr_reader :basket

  def initialize
    @basket = {}
    @menu = Menu::MENU
  end

  def add_to_basket
    puts "What would you like to order?"
    item = gets.chomp.downcase.to_sym
    if @menu.has_key?(item)
      puts "How many #{item}'s would you like?"
      quantity = gets.chomp.to_i
      @basket[item] = quantity
      puts "#{item} added to basket!"
    else
      puts "#{item} is not on the menu."
    end
  end

  def cost
    total = 0
    @basket.each do |item, quantity|
      total += @menu[item] * quantity
    end
    puts "Basket total is £#{total}"
  end

end