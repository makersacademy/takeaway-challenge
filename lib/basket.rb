require_relative 'menu'

class Basket

  attr_accessor :basket_summary

  def initialize(menu = Menu.new)
    @basket_summary = {}
    @menu = menu
  end

  def add(item, quantity)
    @menu.dishes.each do |dish, price|
      if dish == item.to_sym
        @basket_summary["#{quantity}x #{dish}"] = price*quantity
      end
    end
  end

  def menu
    @menu.dishes
  end

  def total
    @total = @basket_summary.values.inject { |total, price| total + price }
    puts "£#{@total}"
  end


  end
