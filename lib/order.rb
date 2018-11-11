class Order

  attr_reader :my_order

  def initialize(my_order = [], total = 0)
    @my_order = my_order
    @total = total
  end

  def select(item, quantity)
    add_items(item, quantity)
    @my_order
  end

  def check_total
    @my_order.each { |hash| @total += hash[:price] }
    display_order
    @total
  end

private

  def add_items(item, quantity)
    Menu::LIST.each do |hash|
      quantity.times { @my_order << hash } if item == hash[:item]
    end
  end

  def display_order
    display = @my_order.uniq.map { |x| "#{x[:item]} x#{@my_order.count(x)}" }
    display.join(', ')
    puts display
  end

end
