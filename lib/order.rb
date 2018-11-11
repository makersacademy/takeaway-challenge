class Order

  attr_reader :my_order

  def initialize(my_order = [])
    @my_order = my_order
  end

  def select(item, quantity)
    add_items(item, quantity)
    @my_order
  end

private

  def add_items(item, quantity)
    Menu::LIST.each do |hash|
        quantity.times { @my_order << hash } if item == hash[:item]
    end
  end

end
