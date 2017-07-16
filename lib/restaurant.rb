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

  def select_dish(dish, quantity)
    raise "This dish is not on the menu" if not_on_menu?(dish)
    order.add_to_basket(dish, quantity, find_price(dish))
  end

  private

  attr_reader :menu, :order

  def parse_menu
    menu.each_with_object(String.new) do |section, output|
      output << section[:category].capitalize + ":\n"
      section[:items].each { |item| output << "  #{item[:name].capitalize} (£#{two_decimal_price(item[:price])})\n" }
    end
  end

  def find_category(dish)
    menu.select { |section| section[:items].find { |item| item[:name] == dish.downcase } }
  end

  def not_on_menu?(dish)
    find_category(dish).empty?
  end

  def find_price(dish)
    find_category(dish).first[:items].find { |item| item[:name] == dish.downcase }[:price]
  end

  def two_decimal_price(number)
    sprintf("%.2f", number)
  end

end
