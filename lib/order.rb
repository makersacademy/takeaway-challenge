class Order
  attr_reader :items
  def initialize menu
    @menu  = menu
    @items = {}
  end

  def add dish
    if items.has_key? dish
      add "#{dish}*".to_sym
    else
      items[dish] = @menu.price_of dish # coupled to menu
    end
    "Subtotal: £#{total}."
  end

  def confirm message_centre, customer_details
    "Total: £#{total}."
    message_centre.process customer_details
  end

  def total
    @items.values.inject(:+)
  end
end
