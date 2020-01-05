require_relative 'menu'

class Takeaway

  attr_reader :menu, :your_order, :total_cost

  def initialize(menu = Menu.new, text = Text.new)
    @menu = menu
    @your_order = []
    @total_cost = 0
    @text = text
  end

  def see_menu
    @menu.menu.each { |food, price| puts "#{food}, #{price}" }
  end

  def add_to_cart(food, quantity = 1)
    raise "Item not on menu" unless @menu.menu.include? food 
    @your_order << "#{quantity} x #{food} = £#{@menu.menu[food] * quantity}"
    @total_cost += (@menu.menu[food] * quantity)
  end

  def view_cart
    puts @your_order
    puts "Order total is £#{total_cost}."
  end

  def complete_order
    view_cart
    @text.send_text(total_cost)
  end

end