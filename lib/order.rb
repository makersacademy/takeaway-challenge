class Order

  attr_reader :foods, :phone_number

  def initialize(phone_number = 'test')
    @foods = []
    @phone_number = phone_number
  end

  def add_food(food, quantity = 1)
    quantity.times {
      @foods << food
    }
    @foods
  end
end
