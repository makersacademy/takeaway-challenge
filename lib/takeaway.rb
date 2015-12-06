class Takeaway
  def initialize menu
    @the_menu = menu
  end

  def menu
    puts the_menu.format
  end

  def order dishes, total
    fail "Cannot place order: #{unavailable dishes} not available!" unless have? dishes
    fail 'Cannot place order: total does not match pricing!' unless correct? dishes, total
    #placeOrder
  end

  private
  attr_reader :the_menu

  def have? dishes
    (dishes.keys - the_menu.raw.keys).empty?
  end

  def unavailable dishes
    (dishes.keys - the_menu.raw.keys).first
  end

  def correct? dishes, total
    dishes.inject(0) { |result, (key, value)| 
      result + (the_menu.raw[key] * value)
    } == total
  end
end
