require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :basket, :menu

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def menu
    @menu.show
  end

  def place_order(item, *number)
    fail "Sorry we don't sell #{item}" if !available?(item)

    @basket << add_item(item)
  end

  private

  def available?(choice)
    return true if Menu::MAINS.has_key?(choice) || Menu::SIDES.has_key?(choice) || Menu::DRINKS.has_key?(choice)
  end

  def add_item(choice)
    if Menu::MAINS.has_key?(choice)
       Menu::MAINS.select { |k,v| k == choice }
    elsif Menu::SIDES.has_key?(choice)
       Menu::SIDES.select { |k,v| k == choice }
    else Menu::DRINKS.has_key?(choice)
      Menu::DRINKS.select { |k,v| k == choice }
    end
  end

  #
  # def total
  #
  # end
  #
  # def confirmed?
  # end

end
