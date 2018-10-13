require_relative 'menu'
require_relative 'dish'

class Order
  attr_reader :basket, :menu

  def initialize(menu)
    @menu = menu
    @basket = []
  end

  def add(dish, amount = 1)
    fail "Sorry, #{dish} is not on our menu." unless @menu.dishes.include?(dish)
    @basket.push({ dish: dish, amount: amount })
  end

  # def delete(dish, amount = 1)
  #   fail "#{dish} is not in your basket" unless basket.map { |item| item[:dish] }.include?(dish)
  #   @basket.delete({ dish: dish, amount: amount })
  #
  # end

  def wipe_basket
    @basket.clear
  end

  def list_basket
    raise 'Basket is empty' if @basket.empty?
    @basket.each do |item|
      puts "#{item[:amount]} portions of #{item[:dish].dish_name}"
    end
  end

  def total
    raise 'basket is empty' if @basket.empty?
    @basket.map { |item| item[:amount] * item[:dish].price }.reduce(:+)
  end


end
