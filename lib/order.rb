class Order
  attr_reader :items

  def initialize(menu)
    @items = nil
    @menu = menu
  end

  def add(items)
    @items = items
    'Added to Basket'
  end

  def total
    sum = 0

    @items.each do |item, quantity|
      sum += @menu.dishes[item] * quantity
    end

    sum
  end 
end
