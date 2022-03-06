require_relative 'menu'
require_relative 'order'


class Bill

  def initialize(order_instance, menu_instance)
    @menu = menu_instance
    @order = order_instance
  end

  def generate_bill
    @order.order_list.each do |k, v|
      puts "#{k} --> #{v} * #{@menu.menu[k]}"
    end
    puts "-----------------------------------"
    puts "total = #{total_amount}"
    puts "-----------------------------------"
    puts ""
    continue_with_the_order?
  end

  def total_amount
    total = 0
    @order.order_list.each do |k, v|
      total += @menu.menu[k] * v
    end

    return total

  end

  def continue_with_the_order?
    puts "Enter continue if you are happy to proceed with the order:"
    proceed_with_order = gets.chomp.downcase
    @order.order_accepted if proceed_with_order == "continue"
  end

end