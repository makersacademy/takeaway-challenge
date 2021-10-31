class Dishes
  def initialize(dish)
    @dishes = [dish]
  end

  def add(dish)
    @dishes.push(dish)
  end
  
  def list
    @dishes.each { |dish| 
      print dish.fetch(:dish) + ": £" +
      dish.fetch(:price).to_s + "\\n"
    }
  end
end

