class Menu
  attr_accessor :menu

  def initialize()
    @menu = { "Salted Caramel Shake" => 5.99, "Red Velvet Shake" => 5.99, "Cookie Dough Sandwich" => 4.99,
       "Choc-zilla Freak Shake" => 8.50, "Vanilla Milkshake" => 3.99 }
  end

  def print
    @menu.map do |item, total|
      "%s £%.2f" % [item.to_s, total]
    end.join(", ")
  end

  def has_item?(item)
    !@menu[item].nil?
  end
end

menu = Menu.new
