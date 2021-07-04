require_relative 'menu'

class Order

  attr_reader :menu, :orders

  def initialize(dish, quantity)
    @menu = menu.new
    @dish = dish
    @quantity = quantity
  end

  def calculate_total

  
   
  end

end

  
      # @orders[dish] = quantity
      # menu.list.slice(dish).each do |food, price|
      #   @subtotal = price * quantity
      #   puts "#{quantity} x of #{food} for £#{price} each is £#{subtotal}"
      #   puts "your total is #{subtotal}"
      #   @total += @subtotal
      #   puts "Total: #{total}"
      # end