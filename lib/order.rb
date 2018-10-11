class Order
  def initialize(dishes=[])
    @dishes = dishes
  end

  def dishes
    @dishes.dup
  end

  def add(*dishes)
    dishes.uniq.each do |dish|
      count = dishes.count(dish)
      count.times { @dishes << dish }
      puts "Added #{dish} x#{count}"
    end
  end

  def view
    dishes.uniq.each do |dish|
      puts summary(dish)
    end
    puts "Total = £#{total}"
  end

  def total
    dishes.map(&:price).inject(&:+)
  end

  private
  def quantity(dish)
    dishes.count(dish)
  end

  def summary(dish)
    "#{dish} x#{quantity(dish)} = £#{dish.price*quantity(dish)}"
  end

end
