class Order

  attr_reader :items, :takeaway

  def initialize(takeaway)
    @items = Hash.new(0)
    @takeaway = takeaway
  end

  def add_item(dish, quantity)
    @items[dish] += quantity
  end

  def summarise
    @items.reduce("") { |memo, (key, val)| memo += "#{key} x#{val} = £#{@takeaway.menu.dishes[key] * val}\n"}
  end

  def calc_total
    @items.reduce(0) { |memo, (key, val)| memo += @takeaway.menu.dishes[key] * val }
  end

end
