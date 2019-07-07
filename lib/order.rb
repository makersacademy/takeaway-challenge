

class Order

  def initialize
    @items = []
    @order_finished = false
  end

  def add(item, amount = 1)
    @items << { item: item, amount: amount }
    "#{amount}x #{item}(s) has been added to your basket."
  end

  def summary
    @items.map.each_with_index do |item, index|
      if (index + 1) < @items.length
        "#{item[:item].capitalize} x #{item[:amount]}"
      else
        "#{item[:item].capitalize} x #{item[:amount]} = £#{total}"
      end
    end.join(', ')
  end

  def total
    @total = 0
    @items.each do |item|
      cost = TakeAway::MENU[item[:item].split(' ').join('_').downcase.to_sym]
      @total += (cost * item[:amount])
    end
    @total
  end

  def items
    @items
  end

  def checkout(checkout = Checkout.new)
    checkout.show_final_order(self)
    checkout.send_text
  end

end
