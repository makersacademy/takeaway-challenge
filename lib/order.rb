class Order

  attr_reader :basket, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0
  end

  def add(item, quantity)
    item = item.to_sym
    @menu.all_dishes.each do |dish|
      @dish = dish
      dish.each do |name, price|
        if name == item
          quantity.times {@basket << @dish}
          quantity.times {@total += price}
        end
      end
    end
    @basket
  end

  def checkout(money)
    
  end


end
