class RamenBar

  attr_accessor :dishes, :order, :total_order

  MENU = {
    'tonkotsu' => 10,
    'kakugiri' => 9,
    'shoyu'    => 9,
    'gyoza'    => 5,
    'edamame'  => 3
  }

  def initialize(dishes = MENU)
    @dishes = dishes
    @order  = []
    @total_order = 0
  end

  def menu
    @dishes.map { |dish, price| "#{dish} - £#{price}" }.join(', ')
  end

  def order_meal(dish, quantity = 1)
    quantity.times { @order << dish }
  end

  def total
    @order.each do |dish|
    @total_order += @dishes[dish]
    end
  end

end

