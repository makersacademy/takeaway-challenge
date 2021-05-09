require 'lib/restaurant.rb'
require 'lib/messaging.rb'

class Order

  def initialize()
    @menu = Restaurant.new.get_menu
    @totalOrderPrice = 0
    @totalItemsOrdered = []
    @checkoutTime = NIL
    @messageTransport = TwilioService.new()
  end

  def get_menu
    puts @menu
  end

  def make_order(item, amount)

    priceOfItem = @menu[item]
    @totalOrderPrice += priceOfItem * amount
    if @totalItemsOrdered.include? item
      @totalItemsOrdered[@totalItemsOrdered.index(item) +  1] += amount
    else
      @totalItemsOrdered << item
      @totalItemsOrdered << amount
    end
  end

  def get_order_summary
    totalOrderSummary = @totalItemsOrdered << @totalOrderPrice
    puts totalOrderSummary.to_s
  end

  def checkout
    @checkoutTime = Time.new + 3600
    checkoutMessage = "Thank you for ordering, your order should be with you at: " + @checkoutTime.to_s
    @messageTransport.createMessage(checkoutMessage)
  end

end


# hoffsOrder = Order.new
# hoffsOrder.get_menu
# hoffsOrder.make_order("Santa Margherita", 4)
# hoffsOrder.make_order("Santa Caterina", 12)
# hoffsOrder.make_order("Rucolina", 1)
# hoffsOrder.get_order_summary
# hoffsOrder.checkout
