require_relative 'menu'

class Order

  attr_reader :menu_list, :basket

  def initialize(menu_list = Menu::MENU_LIST)
    @menu_list = menu_list
    @basket = []
  end

  def add(dish, quantity)
    price = @menu_list[dish]
    price = menu_list[dish]*quantity
    @basket << {dish => price}
    "#{quantity}x #{dish}(s) added to your basket"
  end

  def view_order
    basket.each{| hash | hash.each {|dish, value| puts 'Dish: ' + dish.to_s + '; total amount: £' + value.to_s }}
  end

  # def order_total
  #   # basket.each{ |hash| hash.each { |sum, (key, value)| }}
  #   basket.reduce(0){|sum, hash| sum += hash.price.first}
  # end

end
