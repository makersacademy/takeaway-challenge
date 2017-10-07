class Takeaway

  attr_accessor :menu
  attr_reader :bill

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

  def order_food(doners, burgers, pizzas)
    doners_price = DONER_PRICE * doners
    burgers_price = BURGER_PRICE * burgers
    pizzas_price = PIZZA_PRICE * pizzas
    @bill = doners_price + burgers_price + pizzas_price
    puts "Your bill is £#{@bill}"
  end

  def payment(amount)
    raise "Your payment is incorect." if amount != @bill
    puts "Thank you! Your order was placed and will be delivered before 18:52" if amount >= @bill
  end

end
