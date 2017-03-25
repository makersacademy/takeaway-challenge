require_relative 'menu'

class Customer

  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
    @order
  end

  def view_menu
    Menu::MENU_ITEMS.map do |item|
      "#{item[:food_item]} £#{item[:price]}\n"
    end.inject(:+)
  end

end
