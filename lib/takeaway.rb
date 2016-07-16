class Takeaway

  attr_reader :menu, :basket, :basket_total

  def initialize
    @menu = {"Chicken Gyoza" => 4.20,
             "Katsu Curry & Rice" => 8.50,
             "Nettle Soup" => 2.00,
             "Bento Box" => 5.60,
             "Edamame" => 3.00,}
    @basket = []
    @basket_total = 0
  end

  def select_dish(item,quantity=1)
    raise "'#{item}' is not on our menu." unless item_exists?(item)
    add_selection_to_basket(item,quantity)
    quantity == 1 ? s = '' : s = 's'
    quantity == 1 ? ve = 's' : ve = 've'
    "#{quantity} order#{s} of '#{item}' ha#{ve} been added to your basket."
  end

  private

  def item_exists?(item)
    @menu.has_key?(item)
  end

  def add_selection_to_basket(item,quantity)
    @basket << {name: item, quantity: quantity, price: (@menu[item]*quantity)}
    @basket_total += @basket.last[:price]
  end

end
