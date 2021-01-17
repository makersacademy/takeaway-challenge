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
    raise "#{dish} is not available" unless dish?(dish)
    if @basket.include?(dish)
      @basket[dish] += quantity
    else
      @basket[dish] = quantity
    end
    update_total(@dishes[dish])
    "#{dish}, x#{quantity}"
  end

  def basket
    @basket.each { |item, quantity|
      puts "#{item}, x#{quantity}, £#{@total}"
    }
  end

  def total
    @basket.map { |item, quantity|
      @total += (@dishes[item] * quantity)
    }
    puts "#{@total.to_f.round(2)}"
  end

  def checkout
    send_text = Text.new
    send_text.send_text
  end

  private

  def dish?(dish)
    @dishes[dish]
  end

  def update_total(price)
    @total += price
  end
end
