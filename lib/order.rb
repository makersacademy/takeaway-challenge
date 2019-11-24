class Order

  def initialize(menu, customer)
    @menu = menu
    @customer = customer
    @basket = Hash.new(0)
  end

  def total
    @basket.sum { |dish, qty| @menu.dishes[dish] * qty }
  end

  def add_dish(dish, qty)
    fail "Item not on the menu." unless @menu.dishes[dish]

    @basket[dish] += qty
  end

  def summary
    summary_header

    @basket.map { |dish, qty| 
      "#{dish} x #{qty} = £#{@menu.dishes[dish] * qty}\n"
    }.join
 
  end

  def summary_header
    "Your basket contains:\n" 
  end

  def summary_footer
    "Your total is: £#{total}"
  end

end
