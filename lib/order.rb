class Order

  attr_reader :basket

  def initialize(menu_klass= Menu)
    @menu_klass = menu_klass
    @menu = @menu_klass.new
    @basket = Hash.new(0)
  end

  def add_order(name, quantity)
    @basket[name] += quantity
    basket.each {|key, value| puts "you have added #{key} times #{value} in your basket" }
    @basket
  end

end
