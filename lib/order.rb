class Order
  attr_reader :items

  def initialize(menu_instance = menu)
    @items = Hash.new(0)
    @menu = menu_instance
  end

  def add(dish, quantity)
    items[dish] += quantity
  end

  def total
    items_totals.inject(:+)
   end

  private

  attr_reader :menu

  def items_totals
    items.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end

end
  # def finalize_order
  # end
