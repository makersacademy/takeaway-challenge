require 'order_sms'

class Order
  attr_reader :items

  def initialize(menu, sms)
    @items = nil
    @menu = menu
    @sms = sms
  end

  def add(items)
    @items = items
    'Added to Basket'
  end

  def total
    sum = 0
    @items.each do |item, quantity|
      sum += @menu.dishes[item] * quantity
    end

    sum
  end

  def checkout
    @sms.send("Your order will be with you soon!")
  end
end
