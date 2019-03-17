class Dish

  def initialize(name, price, availability)
    @name = name 
    @price = price
    @availability = availability
  end

  def details
    puts "#{@name} - #{@price} - #{@availability}"
  end
end