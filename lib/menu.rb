require_relative "./default_menu_list.rb"
class Menu
  attr_reader :list
  def initialize(list = DEFAULT_MENU_LIST)
    @list = list
  end

  def print
    puts "Menu"
    puts ""
    @list.map { |item| puts "#{item[:dish]}      £#{item[:price]}" }
  end

  def dish_exists?(dish)
    @list.map { |item| return true if item[:dish] == dish }
    false
  end

  def dish_available?(dish:, quantity:)
    @list.map { |item| 
      if item[:dish] == dish
        return false if (item[:available] - quantity) < 0
        return true 
      end 
    }
  end

  def dish_price(dish)
    @list.map { |item| return item[:price] if dish == item[:dish] }
  end

end