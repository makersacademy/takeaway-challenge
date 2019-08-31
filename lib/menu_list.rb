class MenuList
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_item(identifier, dish)
    @dishes << { id: identifier, dish: dish }
  end

  def available_dishes
    available_dishes = []
    @dishes.each do |dish_hash|
      if dish_hash[:dish].available?
        available_dishes << dish_hash
      end
    end
    available_dishes
  end
end
