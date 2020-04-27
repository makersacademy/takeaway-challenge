require 'menu'

class PlaceOrder

  attr_reader :basket
  def initialize
    @basket = []
    @menu = Menu.new
  end

  def get_order(dish)
    unless in_stock?(dish)
      puts "Nane left."
    else
      @basket << { order: dish, quantity: 1 }
      puts "#{dish}, £ #{cost(dish)}, added to your basket.\n"
    end
  end

  private

  def in_stock?(dish)
    @menu.items.any? { |item| item[:name] == dish }
  end

  def cost(dish)
    item = @menu.items.find { |i| i[:name] == dish }
    item[:price].to_f
  end

end
