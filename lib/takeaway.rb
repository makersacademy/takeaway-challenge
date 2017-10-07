require_relative './menu.rb'

class Takeaway

  attr_reader :menu, :basket

  def initialize(menu = Menu.new)

    @menu = menu
    @basket = []
    @total = 0

  end

  def order_total
    "Total = £#{@total}"
  end

  def print_menu
    menu.print
  end

  def order(dish, quantity = 1)    
    fail 'item is not on the menu' unless menu.items[dish]
    quantity.times do
      @basket << [quantity, dish, menu.items[dish]] 
      @total += menu.items[dish]
    end
    "#{quantity} #{dish} added to basket"
  end

  def order_summary
    to_return = []
    @basket.each do |item|
      to_return << "#{item[0].to_s} #{item[1]} = #{item[0]*item[2]}"
    end
    to_return.join(', ')
  end

  def checkout_order(payment)
    fail 'please pay the correct amount' unless payment == @total
    @basket, @total = [], 0
    "Thank you for your order"
  end

end
