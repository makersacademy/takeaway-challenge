class Takeaway
  attr_reader :options, :my_basket, :total_cost
  MIN_QUANTITY = 1

  def initialize
    @options = {
      'rice' => 3,
      'chips' => 3,
      'bread' => 2,
      'burger' => 10,
      'chicken pie' =>10,
      'steak' => 12,
      'fish and chips' => 10 }

      @my_basket = {}
      @total_cost = 0
    end

  def see_menu
    @options.each {|k, v|
      "#{k}, #{v}"}
  end

  def select(item, quantity)
    raise "item not in menu" unless on_menu?(item)
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

    @total_cost += @options[item]

  end

  def verify(amount)
    amount == @total_cost

  end

  def on_menu?(item)
    @options.include?(item)

  end
end
