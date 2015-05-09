class Customer

  def see_all_dishes(restaurant)
    puts "The following dishes are available:",
    "",
    "--------------------",
    ""
    restaurant.dishes.each { |dish, price| puts "#{dish} - £#{price}" }
  end

end