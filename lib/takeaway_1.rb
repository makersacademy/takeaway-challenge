class TakeAway

  attr_reader :dishes, :order

  def initialize
    @dishes = { hotdog: 5.00, fries: 3.50 }
    @order = {}
  end

  def print_menu
    dishes.map do |title, price|
      "%s £%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end

  def add(dish, quantity)
    order[dish] = quantity
  end

end
