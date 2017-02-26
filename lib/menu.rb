class Menu

  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def add_dish(item, price)
    @dishes << {calculate_key => [item, price]}
  end

  private

  def calculate_key
    @dishes.size + 1
  end

end
