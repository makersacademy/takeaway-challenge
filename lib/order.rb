class Order

  attr_reader :basket, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0
  end

  def add(item, quantity)
    @item = item.to_sym
    @quantity = quantity
    @menu.all_dishes.each do |dish|
      @dish = dish
      dish.each do |name, price|
        if name == @item
          quantity.times {@basket << @dish}
          quantity.times {@total += price}
        end
      end
    end
    @basket
  end

  def basket_summary
    puts @basket
    "Your total for this order is £#{@total}. Please proceed to checkout."
  end

  def checkout(money)

  end


end
