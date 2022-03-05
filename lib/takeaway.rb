class TakeAway
  def initialize
    @order = []
  end

  def menu
    menu = [ 
      { dish: "Pizza", price: 7.49 }, 
      { dish: "Pasta", price: 5.89 }, 
      { dish: "Burger", price: 2.29 }, 
      { dish: "Salad", price: 11.99 },
    ]
  end

  def order(dish)
    menu.each { |item| return @order << item if item[:dish] == dish}
  end

  def total_quantity
    @order.length
  end

  def total_amount
    total_amount = 0
    @order.each { |item| total_amount += item[:price] }
    total_amount.round(2)
  end

  def confirmation
    total_amount
    total_quantity == 1 ? item = "item" : item = "items"
    "You have #{total_quantity} #{item} in your basket for a total of £#{total_amount}"
  end

  def confirmation_text
    
  end
end