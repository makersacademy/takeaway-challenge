require_relative "order.rb"

class Restaurant

  attr_reader :current_menu

  def initialize options
    @menu = options[:menu]
    @menu_content = options[:options]
    populate_menu
  end

  def populate_menu
    @current_menu = @menu.new(@menu_content)
  end

  def check_order order
    total = total_order order
    raise "total incorrect" unless total == order.total
  end

  def total_order order
    total = 0
    order.ordered_items.each do | item, quantity |
      total += quantity * (@current_menu.dishes[item] || 0)
    end
    total
  end

end


#ordered_items: { rice: 1, pizza: 1 }, total: 10.98 ) }