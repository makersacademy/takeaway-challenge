class Takeaway
  ERROR = 'Cannot place order: '
  TOTAL = 'total does not match pricing!'
  DISH = ' not available!'

  def initialize(menu, order_klass, phone)
    @the_menu = menu
    @order_klass = order_klass
    @phone = phone
  end

  def menu
    puts the_menu.format
    the_menu.raw
  end

  def place_order(order, total)
    dishes = order_klass.new(order, total).as_hash
    fail(ERROR + unavailable(dishes) + DISH) unless have? dishes
    fail(ERROR + TOTAL) unless correct?(dishes, total)
    phone.complete_order
  end

  private
  attr_reader :the_menu, :order_klass, :phone

  def have? dishes
    (dishes.keys - the_menu.raw.keys).empty?
  end

  def unavailable dishes
    (dishes.keys - the_menu.raw.keys).first
  end

  def correct?(dishes, total)
    dishes.inject(0) { |result, (dish, number)| 
      result + (the_menu.raw[dish] * number)
    } == total
  end
end
