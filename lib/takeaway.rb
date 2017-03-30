class Takeaway

  attr_reader :menu, :order, :text

  def initialize
    @menu = Menu.new.dishes
    @order = Order.new
    @text = Text.new
  end

  def show_menu
    menu.map do |dish|
      "#{dish.name}: £#{dish.price}"
    end
  end

  def add_to_order(dish_to_add)
    menu.each do |dish|
      (order.items << dish) if dish.name == dish_to_add
    end
  end

  def send_order
    text.send_text
    self.order = Order.new
  end

  private

  attr_writer :order
end
