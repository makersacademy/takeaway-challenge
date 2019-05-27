class Menu
  attr_reader :menu, :default_menu

  DEFAULT_MENU = [
    FoodItem.new("Pizza", 15.00),
    FoodItem.new("Chips", 5.00)
  ]

  def initialize(default_menu = DEFAULT_MENU)
    @default_menu = default_menu
    @menu = []
  end

  def create_default
    @default_menu.each { |food_item|
      add(food_item)
    }
  end

  def add(food_item)
    @menu << food_item
  end

  def remove(food_item)
    @menu.delete(food_item)
    @menu
  end

  def display_menu
    @menu.each { |food_item|
      puts "#{food_item.name}: £%.2f" % food_item.price.to_s
    }
  end

  def check_menu_for(food_item)
    !@menu.include?(food_item)
  end
end
