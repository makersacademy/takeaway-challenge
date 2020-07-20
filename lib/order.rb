class Order

  attr_reader :basket, :cart
  def initialize(menu = Menu.new)
    @basket = Hash.new
    @menu = menu
    @cart = []
  end

  def order(item_number, quantity = 1)
    @basket[item_number] = quantity
  end

  def order_total
    @basket.each do |k,v|
      @total = @menu.meals[k] * v
    end
    @total
  end

  def send_text(confirmation = Confirmation.new)
    confirmation.place_order
  end
end
