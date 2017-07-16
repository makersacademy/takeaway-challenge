class Restaurant

  def initialize(menu)
    @menu = menu
  end

  def display_menu
    print parse_menu
  end

  private

  attr_reader :menu

  def parse_menu
    menu.each_with_object(String.new) do |section, output|
      output << section[:category].capitalize + ":\n"
      section[:items].each { |item| output << "  #{item[:name].capitalize} (£#{two_decimal_price(item[:price])})\n" }
    end
  end

  def two_decimal_price(number)
    sprintf("%.2f", number)
  end

end
