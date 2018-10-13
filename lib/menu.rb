require_relative 'order'

class Menu

  attr_reader :items, :item_selected, :order

  def initialize
    @items = [{ "1 Spaghetti Bolognese" => 9 }, { "2 Pasta Puttanesca" => 9 },
      { "3 Margherita Pizza " => 7 }, { "4 Pepperoni Pizza" => 8 }]
    @item_selected = nil
    @order = Order.new
  end

  def view
    @items.each do |item|
      puts item
    end
  end

  def add(item_number)
    @items.each_with_index do |item, index|
      @item_selected = item if item_number == (index + 1)
    end
    @order.add(@item_selected)
    @order.sum_total
    @order
  end

  def delete(item_number)
    @order.delete(item_number)
    @order.sum_total
    @order
  end

  def check_total
    raise 'Wrong total' if @order.total != @order.sum.reduce(:+)
    #else send a text
  end

end
