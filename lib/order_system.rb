class OrderSystem
  attr_reader :menu, :order_list

  def initialize(menu)
    @menu = menu
    @order_list = {}
  end

  def place_order(item, quantity)
    @order_list[item.to_sym] = [quantity, total_price(item, quantity)]
  end

  def show_order
    order_list.each do |item|
      puts "#{item[1][0]} x #{item[0]} #{item[1][1]}"
    end
  end

  private

  def total_price(item, quantity)
    quantity * menu.list[item.to_sym]
  end
end
