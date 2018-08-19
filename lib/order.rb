class Order
  attr_reader :basket, :menu, :messager
  def initialize(menu = Menu.new, messager = Messager.new)
    @basket = []
    @menu = menu
    @messager = messager
  end

  def add(dish, quantity = 1)
    raise "#{dish} is not on the menu" unless menu.dishes.key?(dish)
    quantity.times do
      basket << { dish => menu.dishes[dish] }
    end
    "added to basket: #{dish} x#{quantity} for #{menu.dishes[dish]} each"
  end

  def checkout
    messager.send_eta_text
    "Order placed: you will receive a text message soon"
  end

  def check
    pretty_basket
  end

private

  def pretty_basket
    new_basket = []
    total = 0
    basket.each do |element|
      element.each do |dish, price|
        new_basket << "#{dish}: £#{price}"
        total += price
      end
    end
    new_basket << "Total: £#{total}"
    new_basket
  end
end
