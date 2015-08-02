require_relative "order.rb"
require_relative "messenger.rb"

class Restaurant

  attr_reader :current_menu, :messenger

  def initialize options
    @menu = options[:menu]
    @menu_content = options[:options]
    @messenger_to_use = options[:messenger]
    populate_menu
    create_messenger
  end

  def populate_menu
    @current_menu = @menu.new(@menu_content)
  end

  def create_messenger
    @messenger = @messenger_to_use.new
  end

  def place_order order
    check_order_total order
    @messenger.send_message order
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

