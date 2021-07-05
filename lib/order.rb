class Order
  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def show_menu
    @menu.list
  end

  def order(dish, quantity = 1)
    fail "This dish is not on our menu" unless @menu.contains?(dish)

    @basket[dish] += quantity
    "#{quantity} #{dish.name}'s has been added to your basket"
  end

  def current_basket
    @basket.map do |dish, quantity|
    "#{quantity}x #{dish.name} = £#{dish.price * quantity}"
    end.join(", ")
  end

  def empty?
    @basket == {}
  end


  def total
    "Your order's total: £#{calculate_price}"
  end

  def correct?(price)
    price == calculate_price
  end

  def complete
    @basket = Hash.new(0)
    "Thank you, come again!"
  end

  private

  def calculate_price
    @basket.reduce(0) { |total, (dish, quantity)| total + dish.price * quantity }
  end
end