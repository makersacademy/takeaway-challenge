require_relative 'menu'

class Order

  attr_accessor :order_content, :bill_total
  attr_reader :sushi_menu

  def initialize sushi_menu
    @sushi_menu = sushi_menu
    @bill_total = 0.0
    @order_content = []
  end

  def display_menu
    @menu.each do |dish, price|
      puts "#{dish}: £#{price}"
    end
  end

  def add_dish dish, quantity
    raise 'Dish not on menu!' unless sushi_menu.menu.include?(dish)
    quantity.times do
      order_content << dish
      self.bill_total = self.bill_total + sushi_menu.menu[dish]
    end
  end

  def remove_dish dish, quantity
    quantity.times do
      order_content.delete(dish)
      self.bill_total = self.bill_total - sushi_menu.menu[dish]
    end
  end

  def print_itemised_bill
    order_content.each do |item|
      price = sushi_menu.menu[item]
      itemised_bill = "#{item}".ljust(5) + "£#{price}".rjust(10)
      puts itemised_bill
    end
    puts "Bill total: £#{bill_total}"
  end

end
