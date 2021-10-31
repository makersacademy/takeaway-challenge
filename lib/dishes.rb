class Dishes
  def initialize(dish)
    @dishes = [dish]
  end

  def add(dish)
    @dishes.push(dish)
  end
  
  def list
    @dishes.each { |dish| 
<<<<<<< HEAD
      print dish.fetch(:dish) + ": £" +
      dish.fetch(:price).to_s + "\\n"
=======
      puts dish.fetch(:dish) + ": £" +
      dish.fetch(:price).to_s
>>>>>>> refactor_test
    }
  end
end

