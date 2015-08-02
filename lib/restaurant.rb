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

  def place_order order, customer
    check_order_total order
    customer.send_confirmation_message
  end

  private

  def check_order_total order
    total = total_order order
    raise "incorrect order" if total != order.total || total == 0
  end

  def total_order order
    total = 0
    order.ordered_items.each do | item, quantity |
      total += quantity * (@current_menu.dishes[item] || 0)
    end
    total
  end
end

