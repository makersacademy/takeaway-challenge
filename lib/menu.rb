class Menu

  def initialize
    @items = Hash.new(0)
  end

  def show
    @items.to_s
  end

  def add_dish(name, price)
    @items[name] = price
  end

  def price(name)
    @items[name]
  end  

end
