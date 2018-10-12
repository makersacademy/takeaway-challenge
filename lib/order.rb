class Order
  attr_reader :basket

  def initialize(menu)
    @basket = Hash.new(0)
    @menu = menu.menu_items
  end

  def add_items(item, quantity)
    @basket[item] += quantity
  end

  def order_summary
    #Needs refactoring
    output = Array.new
    @basket.each { |key, value|
      output << "#{key} x#{value} = £#{@menu[key] * value}"
    }
    return output.join(', ')
  end

end
