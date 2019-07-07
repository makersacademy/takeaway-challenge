require 'menu'

class Takeaway
  attr_reader :my_basket, :total_cost
  MIN_QUANTITY = 1

  def initialize(menu = Menu.new)

      @my_basket = {}
      @total_cost = 0
      @menu = menu
    end

  def select(item, quantity)
    raise "item not in menu" unless @menu.has?(item)
    total(item)
    @my_basket[item] = quantity

  end

  def view_basket
  "your current order is:"
  @my_basket.each {|k,v|
   "#{k}, #{v}"}
  end

  def place_order
    @my_basket.each {|k,v|
     "#{k}, #{v}"}
     "cost: #{@total_cost}"
     "order placed"

  end


  def total(item)

    @total_cost += @menu.options[item]

  end

  def verify(amount)
    amount == @total_cost

  end


end
