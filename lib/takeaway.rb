class Takeaway
  attr_reader :basket

  def initialize( restaurant, menu)
    @menu = menu
    @restaurant = restaurant
    @basket = {}
  end

  def add( name, qty = 1)
    fail "#{name} not available" unless @menu.contains?(name)
    if @basket.key?(name)
      @basket[name] += qty
    else
      @basket[name] = qty
    end
  end

  def remove( name, qty = 1)
    fail "#{name} not in basket" unless @basket.include?(name)
    fail "Insuffient quantity of #{name} in basket" unless (basket[name] >= qty)
    @basket[name] -= qty
    @basket.delete(name) if @basket[name] == 0
  end

  def menu
    puts @menu
  end

  def summary
    str = ""
    basket.each do |name, qty|
      price = @menu.price( name)
      str = str + "#{name} " + "x#{qty} = £#{price * qty} "
    end
    puts "#{str}"
  end

  def total
    t = 0
    basket.each do |name, qty|
      price = @menu.price( name)
      t += price * qty
    end
    puts "Total: £#{t}"
  end

end