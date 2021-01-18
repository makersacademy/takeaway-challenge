require_relative 'menu'

class Order

  attr_reader :basket, :basket_total

  def initialize(menu = Menu.new, text = Text.new)
    @basket = Hash.new(0)
    @total_cost = 0
    @menu = menu
    @text = text
  end

  def read_menu
    @menu.view_menu
  end

  def add_item(item, quantity = 1)
    raise "Item not on menu, please try again" unless read_menu.has_key?(item)

    @basket[item] += quantity
  end

  def basket_value
    @basket.map do |item, quantity|
      @total_cost += (read_menu[item] * quantity)
    end
    @total_cost
  end

  def view_basket
    @basket
  end

  def checkout
    puts "Thank you for your payment of #{basket_value}, a confirmation text should be sent shortly."
    @text.send_message
  end
end
