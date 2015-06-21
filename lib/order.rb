require_relative 'menu'

class Order

  attr_accessor :order_content, :bill_total
  attr_reader :menu

  def initialize
    @menu = { 'California roll' =>    4.0,
              'Spicy salmon roll' =>  4.0,
              'Spicy tuna roll' =>    4.5,
              'Dragon roll' =>        6.0,
              'Prawn tempura roll' => 5.0,
              'Vegetarian roll' =>    3.5 }
    @bill_total = 0.0
    @order_content = []
  end

  def display_menu
    @menu.each do |dish, price|
      puts "#{dish}: £#{price}"
    end
  end

  def add_dish dish, quantity
    raise 'Dish not on menu!' unless menu.include?(dish)
    quantity.times { order_content << dish }
    running_total dish, quantity
  end

  def running_total dish, quantity
    dish_price = menu[dish] * quantity
    self.bill_total += dish_price
  end

end
