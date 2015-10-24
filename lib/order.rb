class Order

  def initialize(menu_klass: menu_klass)
    @menu = menu_klass.new
    @order_lines = Hash.new(0)
  end

  def pick(description)
    @menu.choose(description)
  end

  def add(dish, qty)
    @order_lines[dish] += qty
  end

  def order_lines
    @order_lines.dup
  end

  def to_s
    order_string = ""
    @order_lines.each {|key, value| order_string << "#{value}\t#{key.to_s}\n" }
    order_string
  end
end
