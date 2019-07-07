class Order

  def initialize
    @items = Hash.new(0)
    @order_finished = false
  end

  def add(item, amount = 1)
    @items[item] += amount
    "#{amount}x #{item}(s) has been added to your basket."
  end

  def summary
    @items.map do |key, value|
      "#{key.capitalize} x #{value}"
    end.join(', ') + " = £#{total}"
  end

  def total
    @total = 0
    @items.each do |item, amount|
      cost = TakeAway::MENU[item.split(' ').join('_').downcase.to_sym]
      @total += (cost * amount)
    end
    @total
  end

  def checkout(checkout_message = CheckOutMessage.new)
    summary
    checkout_message.send_text
    @order_finished = true
  end

end
