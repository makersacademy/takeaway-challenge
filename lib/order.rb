require_relative 'menu'

class Order 

  attr_reader :menu, :final_total

  def initialize(menu = Menu.new)
    @menu = menu.menu
    @my_order = []
    @total = []
    @final_total = 0
  end

  def order_meal(*items)
    items.each do |item|
      if @menu.has_key?(item)
        @my_order.push(item)
      else
        raise "that's not on the menu!"
      end
    end
  end

  def calculate_total
    @my_order.each do |item|
      @total.push(@menu[item])
    end
    @final_total += @total.sum
  end

end