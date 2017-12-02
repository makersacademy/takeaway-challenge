require 'menu'
class Order
  attr_reader :basket, :dish

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
    @dish = dish
  end

  def add_dish(dish, quantity = 1)
    puts "Hi, please enter the name of the dish you want to add."
    @dish = gets.chomp
    fail "This dish is not on the menu" unless dish_available?
    puts "Hi, please enter the quantity of the dish."
    @quantity = gets.chomp.to_i
    @basket[@dish] += quantity
  end

  def remove_dish(dish, quantity = 1)
    puts "Hi, please enter the name of the dish you want to remove."
    @dish = gets.chomp
    raise "This dish is not in the basket." if not_in_basket?(dish, quantity)
    @basket[@dish] -= quantity
  end

  def review_order
    @basket.map{|dish, quantity|[dish, quantity]}.to_h
  end

  def order_total
    @basket.keys.map {|dish| dish.price.to_f * @basket[dish].to_f}.reduce(:+)
  end
  

  private
  def dish_available?
    @menu.menu.map do |dish|
      return true if @dish.downcase == dish.name
    end
  end

  def not_in_basket?(dish, quantity)
    @basket[@dish] < quantity || @basket[@dish].nil?
  end


end
