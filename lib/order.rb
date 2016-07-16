require_relative 'menu'

class Order
  attr_reader :order
  attr_reader :customer

  def initialize(customer)
    @customer = customer
    @order = []
    @menu = Menu.new
    @bill = 0
  end

  def show_menu
    @menu.menu_items
  end

  def add_to_order(item, quantity)
    quantity.times do
      @order << item
    end
  end

  def bill
    calculate_bill
  end

  private
  def calculate_bill
    @order.each do |item|
      item.each do |name, price|
        @bill += price
      end
    end
  end
end
