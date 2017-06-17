require "./lib/menu.rb"

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
  end

  def add_dish(dish, quantity)
    raise "Dish not available. Please see menu for options." if !menu.dishes.include?(dish)
    basket.store(dish, quantity)
    return "#{quantity} x #{dish}(s) added to your basket."
  end

  def total
    total = 0
    basket.each do |k, v|
      total = total + (v * menu.get_price(k))
    end
    p "Your order total is £#{total}"
  end

  def checkout
    p "Enter 'Yes' if you would like to place your order"
    confirm = gets.chomp
    if confirm == 'Yes'
      "Thankyou! Your order was placed and will be delivered before #{delivery_time}"
    end
  end

private

  def delivery_time
   (Time.now + (60 * 60)).strftime("%H:%M")
 end

end
