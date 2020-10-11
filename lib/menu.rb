
class Menu

  def initialize(menu_file = "menu_1.csv")
    @menu = []
    @menu_file = "./lib/menus/#{menu_file}"
    load_menu
  end

  def print_menu
    @menu.each {|item| puts "#{item[:item]} ~ £#{item[:price]}"}
    true
  end

  def find_price(item)
    @menu.each do |food|
      return food[:price] if same_food?(food[:item], item)
    end
  end

  def menu
    @menu
  end

  private

  def same_food?(menu_item, user_input)
    menu_item.to_s.downcase == user_input.downcase
  end

  def load_menu
    File.foreach(@menu_file) do |line|
      item, price = line.chomp.split(',')
      add_items(item, price)
    end
  end

  def add_items(item, price)
    @menu << {item: item, price: price.to_i }
  end
end