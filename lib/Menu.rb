class Menu
end

  def initialize
    @menu = {"Taco"=>1.00, "Burrito"=>1.50, "Chips"=>1.00, "Queso"=> 0.50, "Guacamole"=>1.00}
  end

  def show_menu
    puts "See the menu:"
    menu.each do |item, price|
      puts "#{item.capitalize} - £#{price}"
  end

  def check_price(item)
    fail "This item is not available" unless match_item(item)
    match_item(item)
  end

  def calculate_subtotal(cart)
    output = []
    cart.each do |item, quantity|
      output << [item, quantity, match_item(item) * quantity]
  end

    output
  end

private

attr_reader :menu

def match_item(item)
  menu[item]
end
  end
