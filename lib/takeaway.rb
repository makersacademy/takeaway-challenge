require 'menu'
require 'order'

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

  @my_basket.each {|k,v|
   "#{k}, #{v}"}
   "Total: #{@total_cost}"
  end



  def total(item)

    @total_cost += @menu.options[item]

  end

  def verify(amount)
    @expected_amount = amount
  end

  def place_order
    raise "your order does not equal your expected amount" unless equal?
    "Your order: #{view_basket}"
    text = " Thank you! Your order was placed and will be delivered before 18:52"
    #send text
    return text
  end

  def equal?
    @expected_amount == @total_cost
  end

end
