class Order
  attr_reader :items
  
  def initialize(menu)
    @menu = menu
    @items = []
  end

  def add_dish(dish_no:, qty:)
    dish = @menu.select(dish_no: dish_no)

    @items << { dish: dish, qty: qty }

    view_total
  end

  def view_total
    total = 0
    @items.each do |item|
      total += item[:dish].price * item[:qty]
    end
    format_with_currency(total)    
  end

  def format_with_currency(total)
    "£#{'%.2f' % total}"
  end

  private :view_total, :format_with_currency
end