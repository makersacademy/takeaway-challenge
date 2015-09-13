module Order

  def make_order(item, quantity)
    fail "Cannot order items not on the menu" unless in_stock?(item)
    if @order.include?(item)
      @order[item] += quantity
    else
      @order.store(item, quantity)
      "#{quantity} x #{item} has been added to your order"
    end
  end

  def review
    print "Your order:"
    order.map{|item, quantity| "#{item}: #{quantity}"}.join(", ")
  end

  def total
    order.map{|item, quantity| menu.items[item] * quantity}.inject(:+)
  end

  def ind_total
    order.map{|item, quantity| "#{item}: £#{menu.items[item] * quantity}" }
  end

end
