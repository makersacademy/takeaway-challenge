class Order
  attr_reader :list_of_orders, :dish
  def initialize( dish = Dish, menu = Menu)
    @list_of_orders = []
    @dish = dish
    @menu = menu
end

def add_order(name, amount)
  dish = Menu::MENU.select { |dish| dish[:name] == name }.reduce(&:merge)
  amount.times { @order_list << @dish.new(name, dish.fetch(:price)) }
end
end