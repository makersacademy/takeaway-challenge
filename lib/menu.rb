class Menu
  def initialize(dishes)
    @dishes = dishes
  end

  def list_dishes
    all_dishes.each_with_index.map { |dish, index|
      "#{index + 1}. #{dish}"
    }.join("\n")
  end

  private

  def all_dishes
    @dishes
  end
end
