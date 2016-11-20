class TakeawayShop

  attr_reader :menu, :orders

  def initialize
    @orders = []
  end

  def take_orders( order )
    @new = order
    @orders << @new
    confirm_order
  end

private

  def confirm_order

    total_price = 0
    #items when order is more then 2, item when order is only one.
    @new.order.size > 1 ? s = "s" : s = ""
    puts "You've orderd #{ @new.order.size } item#{s}."
    puts "----------------------"

    #show items which the customer ordered
    (@new.order).each do |item|
        puts "#{ item }  £#{ @menu[item] }"
        total_price += @menu[item]
    end

    "[ total: £#{ total_price } ]"

  end

end
