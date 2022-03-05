require_relative 'menu'
require_relative 'order'

class Bill


  def initialize(order_instance, menu_instance)
    @menu = menu_instance
    @order = order_instance
  end

  def display_bill
    @order.order_list.each do |k, v|
      puts "#{k} --> #{v} * #{@menu.menu[k]}"
    end
    puts "-----------------------------------"
    puts "total = #{total_amount}"
  end


  def total_amount
    total = 0
    @order.order_list.each do |k, v|
      total += @menu.menu[k] * v
    end

    return total

  end

end