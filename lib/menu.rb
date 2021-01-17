class Menu

  MENU = {
    chicken: 5,
    potato: 2
  }

  def display_menu
    printed_menu
  end

  private

  def printed_menu
    MENU.map do |item, price|
      "#{item.capitalize}: £#{price}"
    end.join(", ")
  end
end
