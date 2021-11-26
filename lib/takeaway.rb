require_relative 'order'
class Takeaway

  attr_reader :name, :menu, :basket

  def initialize(name)
    @name = name
    # @basket = []
    @menu = { 
      'Spring Rolls': 2.99, 
      'Chicken Chow Mein': 6.99, 
      'Chilli Beef': 7.99
    }
    @order = Order.new
  end

  def see_menu
    @menu.each do |item, price|
      p "#{item} : £#{price}"
    end
  end

  def order(item)
    raise "Item is not on the menu" unless @menu.key?(item)
    @order.basket << { item => @menu[item] }
  end

end
