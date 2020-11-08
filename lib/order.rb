require './lib/menu'

class Order

  attr_reader :order_list

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

  def view_order
    @order_list.each do |item|
      puts "#{item[:item_and_price][:dish]} £#{item[:item_and_price][:price]} x#{item[:quantity]}"
    end
  end

  def total
    sub_totals = @order_list.map { |item| item[:item_and_price][:price] * item[:quantity] }
    puts "total to pay: £#{'%.2f' % sub_totals.inject(0, :+)}"
  end
end
