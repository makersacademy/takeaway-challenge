class Menu
  attr_reader :menu, :order
  def initialize
    @menu = { "Pasta" => 9, "Pizza" => 7, "Steak" => 40, "Ice Cream" => 2 }
    @order = []
  end

  def show_menu
    @menu.each { |item, price| puts "#{item}: £#{price}" }
  end

  def add_to_order(item, quantity)
    raise "That is not on the menu!" if price(item) == nil
    quantity.times {@order << {item => price(item)}}
    "You have added #{item} to your order"
  end

  def price(item)
    @menu[item] 
  end
end

class Order

end
