class Order

  attr_accessor :dishes
  attr_reader :running_total

  def initialize
    @dishes = []
    @running_total = 0.0
  end

  def add_dish dish
    @dishes << dish
    @running_total += dish[:price]
  end

  def show_running_order
    @dishes.each { |k| "Name: #{k[:name]}; Price: £#{k[:price]}" }
  end

end