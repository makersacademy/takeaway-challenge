class Order

  attr_reader :list

  def initialize
    @list = {}
  end

  def add_item(item, quantity)
    list.include?(item) ? add_new(item, quantity) : add_more(item, quantity)
  end

  private

  def add_new(item, quantity)
    list[item] = quantity
  end

  def add_more(item, quantity)
    list[item] = list[item] + quantity
  end
end
