class Customer

  attr_accessor :order, :total_cost

  def initialize
    @order = []
    @total_cost = 0
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
      price = restaurant.dishes.fetch(item)
      order << [item.to_s, price]
    else
      fail 'Dish not available'
    end
  end

  def current_order

    if order.empty?
      "Nothing ordered yet"
    else
      order.each do |selection|
        puts "#{selection[0]}, £#{selection[1]}"
      end
      total_cost
      "Total, #{order.length} items at £#{total_cost}"
    end
  end

  def total_cost
    order.inject(0) { |sum, value| sum + value[1] }
  end

end