require 'order'

class Restaurant

  MENU = @menu
  attr_reader :menu

  def initialize(menu = $example_menu)
    @menu = menu
  end

  def place_order
    view_menu
    order = Order.new
    #order.take_order
    #order.show_order

  end

  def view_menu
    formatted_menu = []
    @menu.each_with_index { |item, i| item.each do |name, price| formatted_menu << "#{name} - £#{price}" end }
    formatted_menu
  end

end



$example_menu = [
  "Pici_cacio & pepe" => 6,
  "Burrata" => 5,
  "Salmon crudo" => 10,
  "Ribeye steak" => 26, 
  "Ocotpus potjie" => 9,
  "Charred aubergine" => 12,
  "Duck breast" => 14,
  "Spinach (side)" => 6,
  "Chips (side)" => 5,
  "Salmon" => 4
  ]