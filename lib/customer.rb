require 'time'

class Customer

  attr_accessor :name
  attr_reader :order
  attr_reader :dishes
  attr_reader :amount
  attr_reader :restaurant

  def initialize(name = 'Customer')
    @name = name
  end

  def view_menu(restaurant)
    @restaurant = restaurant
    restaurant.menu
  end

  def choose_dishes(*dishes)
    @dishes = dishes
    @restaurant.receive_order(@dishes)
    @dishes
  end

  def choose_amount(*amount)
    @order = []
    if amount.length == 1
      num = amount[0].to_i
      @dishes.each do |dish|
        num.times {order << dish}
      end
    else
      amounts = Hash[@dishes.zip(amount)]
      amounts.each do |dish, amount|
        amount.times do
          order << dish
        end
      end
    end
    @order
  end

  def view_order(menu)
    @order_total = []
    @order.each do |dish|
      menu.dishes.select {|k, v| @order_total << [k, v] if k == dish }
    end
    @order_total
  end

  def view_price
     prices = @order_total.flatten.select {|x| x.is_a? Float}
     total_price = prices.inject(0) {|total, price| total + price}
     total_price
  end

  def place_order

  end
end

