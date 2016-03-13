class Menu

  def initialize
    @dishes = []
  end

  def add dish
    @dishes << dish
  end

  def dishes
    @dishes.dup
  end

  def display
    generate_menu
  end

  private

  def generate_menu
    menu = "---\n"
    @dishes.each_with_index do |dish, index|
      menu += "Item: #{index}\nName: #{dish.name}\nPrice: #{dish.price}\n---\n"
    end
    menu
  end
end
