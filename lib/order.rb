class Order

  attr_reader :list

  def initialize
    @list = {}
  end

  def order_item(item, quantity)
    list.include?(item) ? add_more(item, quantity) : add_new(item, quantity)
  end

  private

  def add_more(item, quantity)
    list[item] = list[item] + quantity
  end

  def add_new(item, quantity)
    list[item] = quantity
  end

end
