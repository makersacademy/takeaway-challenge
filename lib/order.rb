class Order
  attr_accessor :ordered

  def initialize
    @ordered = []
  end

  def add_to_order(dish)
    @ordered << dish    
  end

  def show_order
    nothing_ordered
    @ordered.each { |dish| show_dishes(dish) }
  end

  def show_total
    nothing_ordered
    puts "Total cost is £#{find_total}"
  end

  def find_total
    total = 0
    @ordered.each { |dish| total += dish_charge(dish) }
    return total
  end

  private

  def nothing_ordered
    raise 'nothing has been ordered yet' if @ordered.empty?
  end

  def show_dishes(item)
    item.each do |dish, quantity|
      puts "#{quantity}x #{dish.name}, £#{dish.price}"
    end
  end

  def dish_charge(item)
    alltogether = 0
    item.each { |dish, quantity| alltogether += (dish.price * quantity) }
    return alltogether
  end

end
