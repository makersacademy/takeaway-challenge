class Menu

  MENU = {
    chicken: 5,
    potato: 2
  }

  attr_reader :menu

  def initialize(dishes = MENU)
    @dishes = dishes
  end

  def display_menu
    printed_menu
  end

  private

  def printed_menu
    @dishes.map do |item, price|
      "#{item.capitalize}: £#{price}"
    end.join(", ")
  end

end
