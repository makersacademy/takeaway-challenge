require_relative 'menu'

class Order

  def initialize(menu=Menu)
    @menu_list = menu.new
    @order_list = {}
  end

  def print_menu
    menu_list.return_list.each{|item, price| puts "#{item} £#{price}\n"}
  end

  def add_to_order(item,qty)
    @order_list[item] = qty if menu_list.get_price(item) != nil
  end

  def current_order
    order_list
  end


private

  attr_reader :menu_list, :order_list


  # def calculate_total
  #   total = 0
  #   @order_list.each do |item,qty|
  #     total += menu_list.get_price(item) * qty
  #   end
  #   total
  # end
end
