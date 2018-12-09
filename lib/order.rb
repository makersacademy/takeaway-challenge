class Order

  require_relative 'menu'
  require_relative 'restaurant'

  attr_reader :total_order, :menu

  def initialize(menu = Menu.new)
    @total_order = []
    @menu = menu
  end

  def add(input)
    order = input.split(",")
    input_to_add(order)
  end

  def input_to_add(order)
    if order[1].nil?
      @total_order << order[0]
    else
      (order[1].to_i).times do
        @total_order << order[0]
      end
    end
  end

  def summary
    running_total = 0
    p "~ Your order so far ~".center(40)
    puts
    @total_order.each do |i|
      @menu.menu_to_display.each do |k, v|
        if k == i
          p "#{k} ........ £#{'%.2f' % v}".center(40)
          running_total += v
        end
      end
    end
    p
    p "Total ........ £#{'%.2f' % running_total}".center(40)
  end

end
