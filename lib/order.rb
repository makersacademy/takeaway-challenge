

class Order

  attr_reader :menu, :order_list

  def initialize(menu)
    @menu = menu
    @order_list = {}
  end

  def place_order(item, quantity_needed)
    @order_list[item.to_sym] = [quantity_needed, total_price(item, quantity_needed)]
  end

 # private

  def total_price(item, quantity_needed)
    quantity_needed * menu.list[item.to_sym]
  end

  def show_order
    order_list.each do |item|
    puts "#{item[1][0]} x #{item[0]} #{item[1][1]}"
  end
end

def total_order
  @total_order = 0
  order_list.each { |item| @total_order += item[1][1] }
  return @total_order
end 
end
