require_relative 'order'
require_relative 'menu'
require_relative 'message'

class Order
  attr_reader :menu, :dish_num, :quantity, :current_order, :total_cost, :order_takeaway

  def initialize(menu = Menu.new)
    @menu = menu
    @sms = TextMessage.new
    @dishes = @menu.menu_items
    @dish_num = []
    @quantity = []
    @current_order = []
    @total_cost = 0
  end

  def order_takeaway
    print_menu
    take_order
    order_confirmation
    @sms.send_sms
  end

  def print_menu
    @menu.print_dishes
  end

  def take_order
    while @dish_num.last != 0
      puts('Enter dish number you would like to order (Press enter twice to exit)')
      @dish_num << $stdin.gets.to_i
      puts('Enter the quantity')
      @quantity << $stdin.gets.to_i
    end
  end

  def order_confirmation
    @dish_num.each_with_index do |dish_num, index|
      @quantity[index].times { @current_order << @dishes[dish_num - 1] }
    end
    calculate_total_cost
    print_current_order
  end
  
  private
  
  def calculate_total_cost(current_order = @current_order)
    current_order.each { |hash|
      hash.values.inject(0) { |_name, cost|
        @total_cost += cost
      }
    }
  end
  
  def print_current_order
    puts("Your Order".center(40))
    puts('------------------------------------------')
    menu.print_dishes(@current_order)
    puts('------------------------------------------')
    puts("Total".rjust(35) + "#{@total_cost}".rjust(5))
  end
end
