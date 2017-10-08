require '/Users/oliverpople/Desktop/Makers/Projects/takeaway-challenge/lib/sms.rb'

class Takeaway

  attr_reader :available_dishes, :doners_total, :burgers_total, :pizzas_total

  def initialize(menu_data)
    @available_dishes = menuify(menu_data)
  end

  Menu = Struct.new(:dish, :price)
  def menuify(menu_data)
    menu_data.collect { |cell| Menu.new(cell[0], cell[1]) }
  end

  def print_menu
    available_dishes.collect { |item| print item.dish + " " + item.price.to_s + "\n" }
  end

  def doner_order(quant)
    @doners_total = available_dishes[0].price * quant
  end

  def burger_order(quant)
    @burgers_total = available_dishes[1].price * quant
  end

  def pizza_order(quant)
    @pizzas_total = available_dishes[2].price * quant
  end

  def bill
    @bill = doners_total + burgers_total + pizzas_total
    puts "Your bill is £#{@bill}"
  end

  def payment(amount)
    raise "Your payment is incorect." if amount != @bill
    Sms.new if amount >= @bill
  end

end

menu_data = [["Doner", 5], ["Burger", 10], ["Pizza", 20]]
