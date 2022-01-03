require_relative 'basket'

class Restaurant
  attr_reader :menu

  def initialize
    @menu = [
      {'bibimbap'=>10.50},
      {'bulgogi'=>10.00},
      {'naengmyeon'=>8.00}
    ]
  end

  def see_menu
    menu = {}
    @menu.each do |food_hash| 
      food_hash.each do |item, price| menu[item] = ("£%.2f" % price.to_s )
      end
    end
    menu
  end

  def select_item(selection) 
    choice = @menu.select { |food_hash| food_hash.include?(selection) }
    choice[0]
  end

end