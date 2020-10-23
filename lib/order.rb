require_relative 'menu'
require_relative 'text'
class Order
  def initialize(menu_class:)
    @menu = menu_class
    @order_list = []
  end

  def menu
    @menu.new
  end

  def select(menu_dish_no, how_many)
    list = menu.menu
    @order_list << { item_and_price: list[menu_dish_no - 1], quantity: how_many }
  end

  def see_order
    @order_list.each do |item|
      puts "#{item[:item_and_price][:dish]}, £#{item[:item_and_price][:price]} x#{item[:quantity]}"
    end
  end

  def total
    sub_totals = @order_list.map { |item| item[:item_and_price][:price] * item[:quantity] }
    puts "total to pay: £#{sub_totals.inject(0, :+)}"
  end

  def confirm_order(phone_number)
    Text.new(phone_number).send_text
  end
end
