require_relative "dishes"
class Customer

attr_reader :customer_dishes

  def initialize
    @customer_dishes = []
  end

  def check
    @dishes
  end

  def select(dish)
    @customer_dishes << dish
  end

  def amount_of_dishes
    @customer_dishes.count
  end

end
