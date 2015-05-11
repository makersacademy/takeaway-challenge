require_relative 'restaurant.rb'

class Customer

  attr_accessor :order

  def intialize
    order =  []
  end

  def checks_menu(restaurant)
    restaurant.menu.each do |dish, price|
      puts "#{dish} costs #{price}"
    end
  end

  def selects_item(restaurant, dish, quantity)
    choice = dish
    if restaurant.menu.include?(choice)
      price = restaurant.menu.fetch(choice)
      quantity.times { order << [dish, price] }
    else
      fail 'Sorry, your selection is not on todays menu'
    end
  end

  # def todays_order
  #   if order.empty?
  #     puts 'You have yet to place your order'
  #   else
  #     order.each do |dish|
  #       puts "#{dish[0]}, £#{}"
  #     end
  #     total_cost
  #   end
  # end

  # def total_cost
  #   total_cost = order.length.


  # end
end