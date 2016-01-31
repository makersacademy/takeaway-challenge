class Takeaway

  attr_reader :current_order

  def initialize(menu = Menu.new)
    @dishes = menu.dishes
    @current_order = {}
    @total = 0
  end

  def show_menu
    @dishes
  end

  def order(dish, quantity = 1)
    raise 'Dish not available: not part of the menu' unless @dishes.include?(dish)
    @current_order.merge!({ dish => quantity })
    end

  def show_basket
    line_width = 80
    @total = 0
    puts "~ Basket ~".center(line_width)
    puts ""
    @current_order.each do |key, value|
      if value > 1
        puts "#{key} x #{value}".ljust(line_width/2) + "@#{money_format(@dishes[key])} each = £#{money_format(@dishes[key] * value)}".rjust(line_width/2)
        @total += (@dishes[key] * value)
      else
        puts "#{key} x #{value}".ljust(line_width/2) + "£#{money_format(@dishes[key])}".rjust(line_width/2)
        @total += (@dishes[key] * value)
      end
    end
    puts ""
    puts "Total: £#{money_format(@total)}".rjust(line_width)
  end

  def money_format(number)
    sprintf('%.2f', number)
  end
end
