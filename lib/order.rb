require 'csv'

class Order

attr_reader :order_items, :sum, :your_order

  def initialize(order_items, menu_filename = './resources/menu_list.csv')
    @menu_filename = menu_filename
    @order_items = order_items
    @sum = []
    @your_order = []
  end

  def total
    CSV.foreach(@menu_filename) do |line|
      number, dish, price = line
      @sum << price.to_f if number.to_i == order_items
      @your_order << dish + price if number.to_i == order_items
    end
  end



end
