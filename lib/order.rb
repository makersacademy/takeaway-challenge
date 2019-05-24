require_relative 'menu'

class Order
  attr_reader :menu
  attr_accessor :order_list
  DEFAULT_QUANTITY = 1

  def initialize(menu = Menu.new)
    @menu = menu
    @order_list = {}
    @total_price = 0
  end
  

  # def add(item, quantity)
  #   @order.store(item, quantity)
  #   # puts "what do you want to order?"
  #   # wants = gets.chomp.to_s
  #   if @order.include?(item)
  #     @order[item] += quantity
  #   end
  #   "#{quantity} #{item}(s) added to your order"
  # end

  def add(item, quantity = DEFAULT_QUANTITY)
    if @order_list.include?(item)
      @order_list[item] += quantity
    else
      @order_list[item] = quantity
    end
    "#{quantity} #{item}(s) added to your order"
  end

  # def checkout
  #   puts @order
  #   @order.each do |item, quantity|
  #   @total_price += quantity * @menu.price[item]
  #   end
  #   @total_price
  # end

  # def checkout
  #   total_price = 0
  #   @order.each do |item, quantity|
  #     total_price += quantity * @menu.price(item)
  #   end
  #   total_price
  # end

  def total
    total_price = 0
    @order_list.each do |item, quantity|
      total_price = quantity * menu.price(item)
    end
    total_price
  end

  def complete
    formatted_total = "£#{sprintf("%.2f", total)}"
  end

end
