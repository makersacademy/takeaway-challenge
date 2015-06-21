class Order
  def initialize menu
    @menu  = menu
    @items = {}
  end

  def add dish
    if @items.has_key? dish
      self.add("#{dish}*".to_sym)
    else
      @items[dish] = @menu.price_of dish # regex out the asterisks? # this assumes price_of method on menu
    end
  end

  def items
    @items
  end
end
