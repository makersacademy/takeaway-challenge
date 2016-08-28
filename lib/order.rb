require_relative 'menu'
require_relative 'despatch'

class Order

  def initialize(menu=Menu,despatch=Despatch)
    @menu_list = menu.new
    @order_list = {}
    @despatch = despatch
  end

  def print_menu
    menu_list.return_list.each{|item, price| puts "#{item} £#{price}\n"}
  end

  def place_order(list,total)
    reset_list
    items = list.split(',')
    while !!items[-1]
      line = items.delete_at(-1).split(':')
      add_to_order(line[0],line[-1].to_i)
    end
    calculate_total == total ? despatch_order : fail("Your total was incorrect, the order is rejected!")
  end

  def despatch_order
    order_despatcher = @despatch.new
    order_despatcher.send_order
    reset_list
  end

  def current_order
    order_list
  end
  
  def add_to_order(item,qty)
    @order_list[item] = qty if menu_list.get_price(item) != nil
  end

private

  attr_reader :menu_list, :order_list

  def reset_list
    @order_list = Hash.new
  end

  def calculate_total
    total = 0
    order_list.each do |item,qty|
      total += menu_list.get_price(item) * qty
    end
    total
  end

end
