class Order

  attr_reader :my_order

  def initialize(my_order = [])
    @my_order = my_order
  end

  def select(item, quantity)
    add_items(item, quantity)
    @my_order
  end

  def check_total
    total = 0
    @my_order.each { |hash| total += hash[:price] }
    total
  end

private

  def add_items(item, quantity)
    Menu::LIST.each do |hash|
        quantity.times { @my_order << hash } if item == hash[:item]
    end
  end

end
