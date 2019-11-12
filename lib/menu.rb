class Menu

  attr_reader :dishes

  def initialize
    @dishes
  end

  def dishes
    @dishes = [
      {name: 'crickets', price: 100},
      {name: 'hoppers', price: 150},
      {name: 'beetles', price: 90},
      {name: 'mealworms', price: 10},
      {name: 'scorpian', price: 200},
    ]
  end

  def print
    return @dishes
    end
  end
