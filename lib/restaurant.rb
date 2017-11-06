class Restaurant
  attr_reader :name, :menu

  def initialize(name)
    @name = name
    @menu = []
  end

  def add(dish)
    @menu << dish
  end

  def remove(dish)
    @menu.delete(dish)
  end

  def print_menu
    @menu.each { |item| puts "#{item.name}: £#{item.price}" }
  end

  def start_order
    Order.new(self)
  end

end
