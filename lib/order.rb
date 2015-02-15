class Order

  attr_accessor :send_sms

  def initialize(menu)
    @customer_order = {}
    @menu = menu
    @send_sms = false
  end
  def place_order(items, total)
    items.each_key do |key|
      @customer_order[key] = items[key], sub_total(items[key], key)
    end
    check_total(total)
  end

  def customer_order
    @customer_order
  end


  def check_total(total)
    if total != calc_total
      raise "Total is incorrect, recalculate your order"
      clear_order
    end
  end



  private def clear_order!
    @customer_order = {}
  end

  private def sub_total(qty, item)
    qty * @menu.menu_items[item]
  end

  private def calc_total
    customer_order.inject(0) { |memo, value| memo + value[1][1]}
  end


end