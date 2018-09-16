require './lib/menu'
require './lib/order_confirmer'

class Restaurant

  attr_reader :basket

  def initialize(menu_type: Menu, order_confirmer: OrderConfirmer)
    @menu = menu_type.new
    @basket = Hash.new(0)
    @order_confirmer = order_confirmer.new
  end

  def display_menu
    puts @menu.display_menu
  end

  def add_to_basket(dish, number = 1)
    raise "That dish is not on the menu" unless on_the_menu?(dish)
    @basket[@menu.search_menu(dish)] += number
  end

  def display_basket
    @basket.each do |dish, quantity|
      puts "#{dish[:name]} x #{quantity} = #{num_to_currency(dish[:price] * quantity)}"
    end
  end

  def checkout(sum)
    raise "Wrong sum entered, please enter correct sum" unless basket_sum?(sum)
    puts "You will shortly receive a text confirming your order"
    @order_confirmer.confirm_order
    empty_basket
  end

  def on_the_menu?(dish)
    @menu.on_the_menu?(dish)
  end
  private

  def basket_sum?(sum)
    basket_total = @basket.reduce(0) do |total, (dish, quantity)|
      total + (dish[:price] * quantity)
    end
    basket_total == sum
  end


  def empty_basket
    @basket = Hash.new(0)
    puts "Your basket is now empty"
  end

  def num_to_currency(price)
    sprintf("£%2.2f", price)
  end
end
