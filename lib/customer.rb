class Customer

  attr_accessor :order

  def initialize
    @order = []
  end

  def see_all_dishes(restaurant)
    puts "The following dishes are available:",
    "",
    "--------------------",
    ""
    restaurant.dishes.each { |item, price| puts "#{item} - £#{price}" }
  end

  def select(item, restaurant)
    item = item.to_sym
    if restaurant.dishes.include?(item)
      order << item
    else
      fail 'Dish not available'
    end
  end

end