class Output

  def initialize(order, dishes)
    @order = order
    @dishes = dishes
    @line_width = 80
  end

  def show_total
    puts "Total: £#{ money_format(@order.total) }"
  end

  def show_basket
    puts "~ Basket ~".center(@line_width)
    puts ""
    @order.current_order.each do |key, value|
      if value > 1
        puts "#{ key } x #{ value }".ljust(@line_width/2) + "@#{ money_format(@dishes[key]) } each = £#{ money_format(@dishes[key] * value) }".rjust(@line_width/2)
      else
        puts "#{ key } x #{ value }".ljust(@line_width/2) + "£#{ money_format(@dishes[key]) }".rjust(@line_width/2)
      end
    end
    puts ""
    puts "Total: £#{ money_format(@order.total) }".rjust(@line_width)
  end

  def show_menu
    puts "~ Menu ~".center(@line_width)
    puts ""
    @dishes.each do |key, value|
      puts "#{ key }".ljust(@line_width/2) + "£#{ money_format(value) }".rjust(@line_width/2)
    end
  end

  private

  def money_format(number)
    sprintf('%.2f', number)
  end

end
