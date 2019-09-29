class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add(item, quantity)
    item = item.to_sym
    @menu.all_dishes.each do |dish|
      @dish = dish
      dish.each do |name, price|
        if name == item
          quantity.times {@basket << @dish}
        end
      end
    end
    @basket
  end

  def remove
  end

  def order_summary
  end

  def checkout
  end


end
