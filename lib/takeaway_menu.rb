require_relative 'menu'
require_relative 'text'

class Takeaway
  attr_reader :total, :dishes

  def initialize
    @dishes = Menu.new.dishes
    @basket = {}
    @total = 0
    @send_text = Text.new
  end

  def order(dish, quantity = 1)
    raise "#{dish} is not available" unless dish?(dish)

    @basket.include?(dish) ? repeated_item_in_basket(dish, quantity)
      : new_item_in_basket(dish, quantity)
    update_total(@dishes[dish])
    "#{dish}, x#{quantity}"
  end

  def basket
    @basket.each { |item, quantity|
      puts "#{item}, x#{quantity}, £#{@total}"
    }
  end

  def total_cost
    @basket.map { |item, quantity|
      @total += (@dishes[item] * quantity)
    }
    @total
  end

  def checkout
    @send_text.send_text
  end

  private

  def dish?(dish)
    @dishes[dish]
  end

  def update_total(price)
    @total += price
  end

  def new_item_in_basket(dish, quantity)
    @basket[dish] = quantity
  end

  def repeated_item_in_basket(dish, quantity)
    @basket[dish] += quantity
  end
end
