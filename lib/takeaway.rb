require_relative './menu.rb'

class Takeaway
  attr_reader :basket

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def read_menu
    @menu.items
  end

  def order(menu_item, quantity = 1)
    if @basket.key?(menu_item)
      @basket[menu_item] += quantity 
    else
      @basket[menu_item] = quantity
    end
    "#{quantity}x #{menu_item} added to your order."
  end

  def basket_summary
    basket_total = @basket.map do |item, quantity| 
      "#{item} x#{quantity} = £#{(@menu.items[item] * quantity)}"
    end
    basket_total.join(", ")
  end

  def total 
    @total = @basket.map do |item, quantity|
    (@menu.items[item] * quantity)
    end
    @total.sum
  end

end