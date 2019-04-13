require_relative 'menu'

class Order

  def initialize
    @basket = {}
    @menu = Menu.new
  end

  attr_reader :basket, :menu

  def add(item, quantity)
    @basket[item] = quantity
  end

  def summary
    @basket.each do |item, quantity|
      puts "#{quantity}x #{item}(s) - £#{@menu.list[item] * quantity}"
    end
  end

  def total
    @basket.inject(0) do |total, (item, quantity)|
      total + @menu.list[item] * quantity
    end
  end

end
