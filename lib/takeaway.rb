class Takeaway
  def initialize(menu_class, basket_class, text_class)
    @menu = menu_class.new
    @basket_class = basket_class
    @basket = nil
    @text_class = text_class
  end

  def list_dishes
    @menu.list_dishes
  end

  def add_dish(name, quantity)
    basket.add_dish(name, quantity)
    "#{name} x #{quantity} added to the basket."
  end

  def place_order(total)
    raise "Incorrect total given!" if total != basket.total
    send_text
    "Order placed! Look out for a confirmation text."
  end

  def view_basket
    basket.items
  end

  private

  def send_text
    @text_class.new.send
  end

  def basket
    @basket ||= @basket_class.new(@menu)
  end
end
