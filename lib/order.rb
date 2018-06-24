require './lib/menu.rb'
class Order
  attr_reader :menu, :item, :total_order, :sofar_price

  def initialize
    @menu = Menu.new
    @item = Hash.new(0)
    @total_order = []
    @sofar_price = []
  end

  def add_order(dish, quantity)
    @item = { dish => quantity }
    message
    @total_order << @item
  end

  def order_total
    @total_order
  end

  def backet_summary
    @total_order.each do |item|
        item.each_key do |key|
        price = (@menu.display[key] * item[key])
        @sofar_price << price
      end
    end

    i = 0
    while i < @sofar_price.length
      @total_order.each do |item|
        item.each do |key, value|
          puts "#{key} x#{value} = #{@sofar_price[i]}"
          i+=1
        end
      end
    end
  end

  def total_price
    @sofar_price.inject(:+)
  end

  def message
    @item.each do |key, value|
      puts "#{value}x #{key} added to your backet."
    end
  end
end
