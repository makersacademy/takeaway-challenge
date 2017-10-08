require '/Users/oliverpople/Desktop/Makers/Projects/takeaway-challenge/lib/sms.rb'

class Takeaway

  attr_reader :menu, :bill

  MENU = [["Doner", 5], ["Burger", 10], ["Pizza", 20]]

  DONER_PRICE = 5
  BURGER_PRICE = 10
  PIZZA_PRICE = 20

  def initialize
    @menu = MENU
    @bill = 0
    show_menu(menu)
  end

  def show_menu(menu)
    menu.each_with_index do |inner, index|
      puts "#{index + 1} #{inner.join(" ")}"
    end
  end

  def order_food(don_quant, bur_quant, piz_quant)
    doners_total = DONER_PRICE * don_quant
    burgers_total = BURGER_PRICE * bur_quant
    pizzas_total = PIZZA_PRICE * piz_quant
    @bill = doners_total + burgers_total + pizzas_total
    puts "Your bill is £#{@bill}"
  end

  def payment(amount)
    raise "Your payment is incorect." if amount != @bill
    Sms.new if amount >= @bill
  end

end
