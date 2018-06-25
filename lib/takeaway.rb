require './lib/menu'
require './lib/text'

class Takeaway

  attr_reader :basket, :total_order, :total

  def initialize(menu_list, text = Text.new)
    @menu_list = menu_list.price_list
    @basket = {}
    @total_order = []
    @total = []
    @text = text
  end

  def print_menu
    p @menu_list
  end

  def add_to_basket(dish, quantity)
    @basket[dish] = quantity
    @total_order << @basket
    "#{dish} burrito x #{quantity} added"
  end

  def sub_total
    basket.each do |filling, quantity|
      @price = @menu_list[filling]
      @total << quantity * @price
      puts "#{filling} x #{quantity} is £#{'%.2f' % (quantity * @price)}"
    end
  end

  def total_price
    price = @total.inject(:+)
    checkout(price)
  end

  def checkout(price)
    @text.confirmation(price)
  end
end
