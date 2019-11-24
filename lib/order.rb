class Order
  attr_reader :menu_class, :order

  def initialize(menu_class = Menu.new)
    @order = Hash.new(0)
    @menu_class = menu_class
  end

  def view_menu
    menu_class.view
  end

  def add(dish, quantity = 1)
    order[dish.to_sym] = quantity
    "You added #{quantity} #{dish} dishes to your order"
  end

  def check_order
    "you ordered #{total_dishes} dishes totalling £#{total_price}"
  end

  private

  def total_price
    total = 0
    order.each do |dish, quantity|
      total += quantity
    end
    total
  end

  def total_dishes
    total = 0
    order.each do |dish, quantity|
      puts menu_class.price(dish)
      # total += ( * menu_class.price(dish))
    end
    total
  end
end