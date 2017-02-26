class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_dish(number, menu)
    dish = create_dish(number, menu)
    name = dish.item[:name]
    update_basket(dish, name)
  end

  def get_total
    total = 0
    basket.each { |item|
      total += (item[:price] * item[:quantity])}
    total.round(2)
  end

  def print_basket
    puts "Your basket contains:"
    basket.each {|item|
      puts "#{item[:name]} (£#{item[:price]}) - #{item[:quantity]}"}
    puts "Total: £#{get_total}"
  end


  private

  def already_in_basket?(name)
    basket.any? {|item|
      item[:name] == name}
  end

  def increment_quantity(name)
    basket.each {|item|
      if item[:name] == name
        item[:quantity] += 1
      end
    }
  end

  def update_basket(dish, name)
    if already_in_basket?(name)
      increment_quantity(name)
    else
      @basket << dish.item
    end
  end

  def create_dish(number, menu)
    Dish.new(number, menu)
  end

end
