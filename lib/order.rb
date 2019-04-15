require_relative 'menu'

class Order

  def initialize
    @basket = {}
  end

  attr_reader :basket

  def add(item, quantity)
    @basket[item] = quantity
  end

  def summary
    @basket.each do |item, quantity|
      puts "#{quantity}x #{item}(s) - £#{Menu.new.list[item] * quantity}"
    end
  end

  def total
    @basket.inject(0) do |total, (item, quantity)|
      total + Menu.new.list[item] * quantity
    end
  end

end
