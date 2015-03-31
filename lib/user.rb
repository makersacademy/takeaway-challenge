class User

attr_reader :line_items

  def initialize
    @line_items = []
  end

  def add_to_order(item, number=1)
    number.times do
      @line_items << item
    end
  end

  def order_from(restaurant, total)
    restaurant.check_order(line_items, total)
  end
end
