class Order
  attr_reader :final_order 

  def initialize
    @final_order = []
  end

  def add_item(item, quantity)
    @final_order << { item => quantity }
  end

  def finalize_order(payment)

  end

  def calculate_price(menu)
    menu = menu.menu
    @final_order.map { |ord|
      ord.map { |item, quantity| quantity * menu[item] }
    }.flatten.inject(:+)
  end
end
