class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
    end

  def show_menu
    menu.print_menu
  end

  def order_dish(dish:, quantity:)
    order.store(dish,quantity)
  end

  def view_basket
    calculate
    @basket_details
  end

private

  def calculate
    basket = []
    order.each_pair do |dish,quantity|
      basket << "#{dish} x #{quantity} = £#{menu.find_cost(dish) * quantity}.00"
    end
    @basket_details = basket.join(" ")
  end
end
