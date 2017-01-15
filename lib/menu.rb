require_relative 'dish'

class Menu

  attr_reader :dish_items

  def initialize(*dish_items)
    @dish_items = dish_items
  end

  # def print_menu
  #   puts "Today's Menu"
  #   puts "------------"
  #   dish_items.each do |item|
  #     puts "#{item.name.capitalize}: £#{item.price}"
  #   end
  # end

end
