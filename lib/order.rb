require_relative 'menu'

class Order
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
    @total_price
  end

  def add(item, quantity)
    # puts "what do you want to order?"
    # wants = gets.chomp.to_s
    if @order.include?(item)
      @order[item] += quantity
    else
      "You already ordered that. A reminder, you ordered #{quantity} #{item}(s)"
    end
    "#{quantity} #{item}(s) added to your order"
  end

  def checkout
    total_price = 0
    @order.each do |item, quantity|
    total += quantity * menu.price(item)
    end
    @total_price
  end

end
