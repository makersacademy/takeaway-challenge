require_relative 'menu'

class Customer
  def initialize
  end
  def view_menu
    Menu::MENU_LIST.map do |item|
      "#{item[:food_item]} £#{item[:price]}\n"

    end.inject(:+)
  end
end
