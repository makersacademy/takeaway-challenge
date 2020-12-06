require './lib/menu.rb'

class Restaurant
  attr_accessor :menu, :basket, :total_amount
    
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @total_amount = 0
  end
    
  def list_menu
    @menu.dishes.each do |dish, price|
      puts "#{dish} : #{price}"
    end 
  end

  def order(dish, quantity)
    @basket[dish] = quantity
    @total_amount += @menu.dishes[dish.to_sym] * quantity
  end

  def total_basket
    puts "You have ordered:"
     @basket.each do |dish, quantity|
      puts "#{dish} : #{quantity}"
     end
  end

  def total_price
    "Total bill: £#{@total_amount}" 
  end

  def price_correct?(price) 
    basket_total = 0
    @basket.each do |dish, quantity|
        basket_total += @menu.dishes[dish.to_sym] * quantity
    end 
    basket_total == price ? true : false
  end


end 
