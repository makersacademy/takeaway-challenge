class Dishes
  def initialize(dish)
    @dishes = [dish]
  end

  def add(dish)
    @dishes.push(dish)
  end
  
  def list
    @dishes.each do |dish| 
      puts dish.fetch(:dish) + ": £" +
      dish.fetch(:price).to_s
    end
  end
end
