class Menu

  def initialize(dishes:)
    @dishes = dishes
  end

  def print_out
    @dishes.each_with_index.map { |dish, index| "#{index + 1}: #{dish.name} - £#{dish.price}" }.join("\n")
  end

  def dishes
    @dishes.dup
  end

  def select_with_id(id)
    @dishes[id].nil? ? raise("That is not an item on the menu") : @dishes[id]
  end

end
