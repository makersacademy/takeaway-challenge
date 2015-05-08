class Order

  attr_accessor :dishes
  attr_reader :total

  def initialize
    @dishes = []
    @total = 0.0
  end

  def add_dish dish
    @dishes << dish
    @total += dish[:price]
  end

  def show_order
    @dishes.each { |k| "Name: #{k[:name]}; Price: £#{k[:price]}" }
  end

end