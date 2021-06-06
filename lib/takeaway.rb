class Takeaway

  attr_reader :menu, :orders

  def initialize
    @orders = []
  end

  def take_order(order)
    @new = order
    @orders << @new
    confirm_order
  end

  def confirm_order
    total_price = 0
    # items when order >= 2, item when order == 1.
    @new.order.size > 1 ? s = "s" : s = ""
      puts "You've orderd #{@new.order.size} item#{s}."
      puts "----------------------"
      (@new.order).each do item
      puts "#{item}  £#{@menu[item]}"
      total_price += @menu[item]
    end
  "[total: £#{total_price}]"
  end
end
