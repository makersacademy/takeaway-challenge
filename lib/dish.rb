class Dish
  attr_reader :dishes

  def initialize
    @dishes = []

    preload_dishes
  end

  def print
    return 'Puts no students at this time' if @dishes.empty?
    i = 1
    @dishes.each do |dish|
      "#{i}. #{dish[:name].capitalize.ljust(24, '.')} #{dish[:price]}"
      i += 1
    end
end

  private

  def preload_dishes
    @dishes << { name: 'thai tofu', price: 9.5 }
    @dishes << { name: 'grilled octopus', price: 11 }
    @dishes << { name: 'chipotle bbq chicken', price: 12.5 }
    @dishes << { name: 'harvest', price: 8 }
    @dishes << { name: 'mediterranean spinach', price: 9 }
  end
end
