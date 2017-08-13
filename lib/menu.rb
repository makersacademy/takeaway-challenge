DISHES = {
chicken_chow_mein: 5,
sweet_and_sour_chicken: 5.50
}

class Menu

  attr_reader :dishes, :order

  def initialize
    @order = []
    @dishes = DISHES
  end

  def print_dishes
    @dishes.each do |dish, amount|
      puts "#{dish}: £#{amount}"
    end
  end

  def dish_order(dish, amount = 1)
    amount.times { @order << dish }
  end

  def order_amount
    @order.map { |dish| @dishes[dish] }.inject(:+)
  end
     
end

menu = Menu.new
menu.print_dishes
menu.dish_order(:chicken_chow_mein)
menu.dish_order(:chicken_chow_mein, 5)
p menu.order
menu.dish_order(:sweet_and_sour_chicken)
p menu.order_amount
p menu.order
