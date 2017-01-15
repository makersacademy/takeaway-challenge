require_relative 'dish'

class Menu

  attr_reader :menu_items

  def initialize(*dish_items)
    @menu_items = {}
    dish_items.each do |item|
        menu_items[item.name] = item.price
    end
  end

  # def print_menu
  #   puts "Today's Menu"
  #   puts "------------"
  #   dish_items.each do |item|
  #     puts "#{item.name.capitalize}: £#{item.price}"
  #   end
  # end

end
