class Order
  attr_reader :basket

  def initialize(menu)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add_items(item, quantity)
    raise('Invalid dish. Only items on the menu can be added to your order.') unless @menu.on_menu?(item)
    @basket[item] += quantity
  end

  def order_summary
    # This methods was not required to complete the user stories
    # Review doc showed it in 'Instruction on README' section so I included it
    raise('You have not ordered any dishes.') unless items_ordered?
    @basket.map { |dish, quantity|
      "#{dish} x#{quantity} = #{to_currency(get_price(dish) * quantity)}"
    }.join(', ')


  end

  def total
    to_currency(total_order)
  end

  def checkout(amount)
    raise('You have not ordered any dishes.') unless items_ordered?
    raise('Incorrect amount. You need to enter the correct order total to checkout.') unless correct_amount?(amount)
  end

  private
  def get_price(dish)
    @menu.menu_items[dish]
  end

  def total_order
    @basket.map { |dish, quantity|
      get_price(dish) * quantity
    }.sum
  end

  def correct_amount?(amount)
    amount == total_order
  end

  def items_ordered?
    @basket.length.positive?
  end

  def to_currency(amount)
    format("£%.2f", amount)
  end

end
