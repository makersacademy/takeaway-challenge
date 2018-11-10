

class Restaurant
  attr_reader :menu, :order, :total_amount

  MENU = { "Ruby's Salad" => 6,
           "Matz 'n' Cheese" => 8,
           "Makers Triple Burger" => 10,
           "Python's Steak" => 12
         }

  def initialize(menu = MENU)
    @menu = menu
    @order = order
    @order = {}
    @total_amount = 0
  end

  def show_menu
    @menu.each { |dish, price| puts "#{dish}: £#{price}" }
  end

  def add(dish, quantity=1)
    available?(dish)
    @order[dish] = quantity
  end

  def basket

  end

  private

  def available?(dish)
    raise "Sorry this item is not available" unless @menu.include?(dish)
  end

end
