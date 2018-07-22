require_relative './menu.rb'

class Order
  attr_reader :food, :order_array
  def initialize
    @order_array = []
  end

  def add(food, quantity)
    @food = food
    Menu::MENU.each do |hash|
      if hash[:food] == @food.to_s
        quantity.times do
          @order_array << { :food => hash[:food], :price => hash[:price] }
        end
        puts "#{quantity}x #{@food}(s) has been added to your basket"
        return @order_array
      end
    end
  end

  def check_dishes
    @order_array.each do |hash|
      puts "1x #{hash[:food]}"
    end
  end

  def check_total
    total = 0
    @order_array.each do |hash|
      total += hash[:price]
    end
    total
  end

end
