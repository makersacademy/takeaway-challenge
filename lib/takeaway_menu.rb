require_relative 'menu'
require_relative 'text'

class Takeaway

  attr_accessor :basket
  def initialize
    @dishes = Menu.new.dishes
    @basket = {}
    @total = 0
  end

  def read_menu
    @dishes
  end

  def order(dish, quantity = 1)
    raise "#{dish} is not available" if !@dishes[dish]
    if @basket.include?(dish)
      @basket[dish] += quantity
    else
      @basket[dish] = quantity
    end
    "#{dish}, x#{quantity}"
  end

  def basket
    @basket.each { |item, quantity|
      puts "#{item}, x#{quantity}"
    }
  end

  def total
    @basket.map { |item, quantity|
      @total += (@dishes[item] * quantity)
    }
    @total.round(2)
  end

  def checkout
    send_text = Text.new
    send_text.send_text
  end
end
