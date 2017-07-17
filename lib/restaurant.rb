require_relative 'order'
require_relative 'text_message'

class Restaurant

  def initialize(menu, order = Order.new)
    @menu = menu
    @order = order
  end

  def display_menu
    print parse_menu
  end

  def view_order
    order.view_order
  end

  def place_order(total_cost)
    raise "Incorrect order total" unless correct_amount?(total_cost)
    order.send_confirmation
  end

  def select_dish(dish, quantity)
    raise "This dish is not on the menu" if not_on_menu?(dish)
    order.add_to_basket(dish, quantity, find_price(dish))
  end

  private

  attr_reader :menu, :order

  def correct_amount?(total_cost)
    total_cost == order.total_cost
  end

  def parse_menu
    menu[:categories].each_with_object(String.new) do |category, output|
      output << category.capitalize + ":\n"
      menu[:items].each { |dish| output << parsed_display(dish) if dish[:category] == category }
    end
  end

  def parsed_display(dish)
    "  #{dish[:name].capitalize} (£#{two_decimal_price(dish[:price])})\n"
  end

  def retrieve_hash(dish)
    menu[:items].select { |item| item[:name] == dish.downcase }[0]
  end

  def not_on_menu?(dish)
    retrieve_hash(dish).nil?
  end

  def find_price(dish)
    retrieve_hash(dish)[:price]
  end

  def two_decimal_price(number)
    sprintf("%.2f", number)
  end

end
