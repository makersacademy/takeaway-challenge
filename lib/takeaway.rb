require './lib/sms.rb'

class Takeaway
  def initialize(items, sms = Sms.new)
    @items = items
    @sms = sms
  end

  def list_items
    @items
  end    

  def place_order(order)
    @sms.send
    total_price(order)
  end

  private

  def total_price(order)
    total = 0
    order.each do |drink, quantity|
      item_price = @items[drink]
      total += item_price * quantity if item_price
    end
    total
  end
end
