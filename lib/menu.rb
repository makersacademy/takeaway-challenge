

class Menu
  attr_reader :menu
  def initialize(orders = Order.new)
    @menu
    @menu_shower
    @orders = orders
  end

  def load_menu
    foods = File.read("lib/foodlist.csv")
    if foods != nil
      @menu_shower = foods
      @menu = foods.split("\n").map { |item| { item.split[0].to_i => { item.split[1] => item.split[2].to_i } } }
      @orders.load_menu(@menu)
      puts "Menu loaded!"
    else
      puts "Error loading menu!"
    end
  end

  def show_menu
    puts @menu_shower

  end

  def menu_loaded?
    @menu.empty?
  end
end
