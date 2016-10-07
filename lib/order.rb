class Order
  attr_reader

  def initialize
    @selections = []
    @price = 0
  end

  def add(dish)
    @selections << dish
  end

  def selections
    @selections.dup
  end

  def summary
    puts "You have ordered the following #{@selections.count} items:\n\n"
    @selections.each_with_index do |dish, i|
      puts "#{i+1}: #{dish[:name]}, cost #{dish[:price]}"
    end
    puts "\n\nTotal price is #{@price}"
  end

  def total_price
    @selections.each do |dish|
      @price += dish[:price]
    end
    @price
  end


end
