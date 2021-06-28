require_relative 'menu'

class Order

  attr_reader :list, :total, :menu

  def initialize
    @list = []
    @menu = Menu::MEALS
  end

  def add(dish, quantity = 1)
    quantity.times { 
      @list << dish unless !@menu.include?(dish)
    }
  end

  def remove(dish)
    @list.delete(dish)
  end

  def verify(amount)
    fail "The total is incorrect" unless check_total == amount
    true
  end

  def check_total
    @total = 0
    @list.each {
      |dish| @total += (@menu[dish])
    }
    @total.round(2)
  end

end