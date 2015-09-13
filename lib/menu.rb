class Menu
  attr_reader :items

  def initialize
    @items = { pizza: 5.99, burger: 4.99, chips: 2.99, sandwich: 3.99 }
  end

  def list
    menu = ""
    items.each{|dish, price| menu << "#{dish}: £#{price}, "}
    menu.strip.chomp(",")
  end

  def on_menu?(dish)
    items.has_key?(dish)
  end
end
