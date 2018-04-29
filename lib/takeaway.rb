require_relative 'basket'

class Takeaway

  attr_reader :total, :basket, :menu

  def initialize
    @total = 0
    @basket = Basket.new
    @menu = { potato_smilies: 2,
              turkey_twizzlers: 3,
              rice_pudding: 3,
              panda_pop: 1,
              spaghetti_hoops: 1
            }
  end

  def add_to_basket(item, quantity)
    raise "This item is unavailable" unless available?(item)
    @basket.items[item] += quantity
    increment_total(item, quantity)
    "Order confirmed: #{item} x#{quantity}"
  end

  def receipt
    receipt_statement = ""
    @basket.items.each do |item, quantity|
      receipt_statement += "#{item} (x#{quantity}) --- £#{item_total(item, quantity)}, "
    end
    receipt_statement + "Total: £#{"%.2f" % @total}"
  end

  private

  def available?(item)
    @menu.has_key?(item)
  end

  def item_total(key, value)
    value * @menu[key]
  end

  def increment_total(item, quantity)
    @total += @menu[item] * quantity
  end

end
